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
  
  s.add_dependency('json')
  s.add_dependency('hashie')
  s.add_dependency('nokogiri')

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('vcr')
  s.add_development_dependency('fakeweb')
end
