# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'localedata/version'

Gem::Specification.new do |spec|
  spec.name    = 'localedata'
  spec.version = Localedata::VERSION
  spec.authors = ['Juraj Kostolansky']
  spec.email   = ['hello@localedata.com']

  spec.summary  = 'CLI for the Ruby on Rails translation management platform LocaleData'
  spec.homepage = 'https://github.com/localedata/localedata-client'
  spec.license  = 'MIT'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir[
    'README.md', 'LICENSE.txt', 'CHANGELOG.md', 'localedata.gemspec',
    'lib/**/*.rb', 'bin/*'
  ]

  spec.require_paths = ['lib']
  spec.executables   = ['localedata']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'faraday', '>= 0.12.0'
  spec.add_dependency 'thor', '>= 0.20.0'
end
