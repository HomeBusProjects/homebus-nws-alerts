require 'homebus/options'

class NWSAlertsHomebusAppOptions < Homebus::Options
  def app_options(op)
  end

  def banner
    'HomeBus NWS Alert publisher'
  end

  def version
    '0.0.1'
  end

  def name
    'homebus-nws-alerts'
  end
end
