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
    'source_code_uri' => 'https://github.com/localedata/localedata-client',
    'changelog_uri' => 'https://github.com/localedata/localedata-client/blob/main/CHANGELOG.md',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir[
    'README.md', 'LICENSE.txt', 'CHANGELOG.md', 'localedata.gemspec',
    'lib/**/*.rb', 'bin/*'
  ]

  spec.require_paths = ['lib']
  spec.executables   = ['localedata']

  spec.required_ruby_version = '>= 2.7.0'

  spec.add_dependency 'faraday', '>= 0.12.0'
  spec.add_dependency 'thor', '>= 0.20.0'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-minitest'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rake'
end
