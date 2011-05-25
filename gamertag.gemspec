# -*- encoding: utf-8 -*-
$:.push File.expand_path("lib", __FILE__)
require "gamertag/version"

Gem::Specification.new do |s|
  s.name        = "gamertag"
  s.version     = Gamertag::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Baris Balic"]
  s.email       = ["baris@webloch.co.uk"]
  s.homepage    = ""
  s.summary     = %q{A gem for retrieving your xbox live gamertag info}
  s.description = %q{A gem for retrieving your xbox live gamertag info}

  s.rubyforge_project = "gamertag"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
