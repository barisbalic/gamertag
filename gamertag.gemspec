# -*- encoding: utf-8 -*-
$:.push File.expand_path("lib", __FILE__)
require "./lib/gamertag/version"

Gem::Specification.new do |s|
  s.name        = "gamertag"
  s.version     = Gamertag::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Baris Balic", "David Czarnecki"]
  s.email       = ["baris@webloch.co.uk", "dczarnecki@agoragames.com"]
  s.homepage    = "https://github.com/barisbalic/gamertag"
  s.summary     = %q{A gem for retrieving your XBOX Live gamertag information}
  s.description = %q{A gem for retrieving your XBOX Live gamertag information}

  s.rubyforge_project = "gamertag"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('json', '~> 1.5.3')
  s.add_dependency('hashie', '~> 1.1.0')
  s.add_dependency('nokogiri', '~> 1.5.0')

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.6.0')
  s.add_development_dependency('vcr', '~> 1.11.1')
  s.add_development_dependency('fakeweb', '1.3.0')
end
