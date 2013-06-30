# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gamertag/version'

Gem::Specification.new do |spec|
  spec.name          = 'gamertag'
  spec.version       = Gamertag::VERSION
  spec.authors       = ['Baris Balic']
  spec.email         = ['leafybasil@gmail.com']
  spec.description   = %q{A wrapper for the XboxLeaders API}
  spec.summary       = %q{A wrapper for the XboxLeaders API}
  spec.homepage      = 'https://github.com/barisbalic/gamertag'
  spec.licenses      = ['DWHTFYWTPL']

  spec.files         = %w(CHANGELOG.md LICENSE.md README.md gamertag.gemspec)
  spec.files         += Dir.glob("lib/**/*.rb")
  spec.files         += Dir.glob("spec/**/*")
  spec.test_files    = Dir.glob("spec/**/*")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_dependency 'faraday', '~> 0.8'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'multi_json', '~> 1.3'
end
