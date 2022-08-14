#!/usr/bin/env ruby

require 'homebus-nws-alerts/options'
require 'homebus-nws-alerts/app'

nwsalerts_app_options = HomebusNWSAlerts::Options.new

nwsalerts = HomebusNWSAlerts::App.new nwsalerts_app_options.options
nwsalerts.run!
