#!/usr/bin/env ruby

require '../lib/homebus-nws-alerts/options'
require '../lib/homebus-nws-alerts/app'

nwsalerts_app_options = HomebusNWSAlertsOptions.new

nwsalerts = HomebusNWSAlerts.new nwsalerts_app_options.options
nwsalerts.run!
