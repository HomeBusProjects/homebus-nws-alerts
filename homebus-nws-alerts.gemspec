# frozen_string_literal: true

require_relative "lib/homebus-nws-alerts/version"

Gem::Specification.new do |spec|
  spec.name = 'homebus-nws-alerts'
  spec.version = HomebusNWSAlerts::VERSION
  spec.authors = ['John Romkey']
  spec.email = ['58883+romkey@users.noreply.github.com']

  spec.summary = 'Homebus publisher for NWS Weather alerts'
  spec.description = 'Invoked as a Homebus webhook, publishes weather alerts from the US National Weather Service'
  spec.homepage = 'https://github.com/HomeBusProjects/homebus-ctrlh-access'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/HomeBusProjects/homebus-nws-alerts'
#  spec.metadata['changelog_uri'] = 'TODO: Put your gem's CHANGELOG.md URL here.'

  all_files  = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
puts all_files
  spec.files = all_files.grep(%r!^(exe|lib|rubocop)/|^.rubocop.yml$!)
  spec.executables   = all_files.grep(%r!^exe/!) { |f| File.basename(f) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
#  spec.add_dependency 'homebus', '~> 0.30.1', git: 'https://github.com/HomeBusProjects/ruby-homebus', branch: 'main'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
