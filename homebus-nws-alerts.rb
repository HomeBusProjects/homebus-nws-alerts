#!/usr/bin/env ruby

require './options'
require './app'

nwsalerts_app_options = NWSAlertsHomebusAppOptions.new

nwsalerts = NWSAlertsHomebusApp.new nwsalerts_app_options.options
#nwsalerts.setup!
#nwsalerts.work!
nwsalerts.run!
