# coding: utf-8
require 'homebus'

require 'dotenv'

require 'open-uri'
require 'json'
require 'time'

class HomebusNWSAlerts::App < Homebus::App
  DDC_ALERT = 'org.homebus.experimental.alert'

  NWS_ALERT_API_ENDPOINT = 'https://api.weather.gov/alerts'

  def initialize(options)
    @options = options

    super
  end

  def setup!
    Dotenv.load('.env')

    @area = ENV['AREA']
    @ugc = ENV['UGC']

    @device = Homebus::Device.new name: "NWS alerts for #{@area} / #{@ugc}",
                                  manufacturer: 'Homebus',
                                  model: 'NWS alerts',
                                  serial_number: "#{@area} / #{@ugc}"
  end

  def update_interval
    60*15
  end

  def K_to_C(temp)
    temp - 273.15
  end

  def _get_alerts
    begin
      url = "#{NWS_ALERT_API_ENDPOINT}/active?area=#{@area}"

      if options[:verbose]
        puts url
      end

      response = URI.open(url, 'User-Agent' => 'Homebus; homebus-nws-alerts 0.1', 'Accept' => 'application/geo+json').read
      JSON.parse response, symbolize_names: true
    rescue
      nil
    end
  end

  def _rewrite_alert(alert)
    {
      alert_id: alert[:id],
      headline: alert[:headline],
      event: alert[:event],
      certainty: alert[:certainty],
      severity: alert[:severity],
      ends: DateTime.parse(alert[:expires]).to_time.to_i,
      description: alert[:description],
      instruction: alert[:instruction]
    }
  end

  def work!
    alerts = _get_alerts
    unless alerts
      if options[:verbose]
        puts 'no alerts found'
      end
    end

    a = alerts[:features].select do |feature|
      feature[:properties][:geocode][:UGC].include? @ugc
    end

    alerts = []
    a.each { |b| alerts.push(_rewrite_alert( b[:properties])) }

    if options[:verbose]
      pp alerts
    end

    @device.publish! DDC_ALERT, alerts

    sleep update_interval
  end

  def name
    'HomeBus NWS alerts publisher'
  end

  def publishes
    [ DDC_ALERT ]
  end

  def devices
    [ @device ]
  end
end
