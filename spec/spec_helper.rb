require 'rubygems'
require 'rspec'
require 'vcr'

require File.join(File.dirname(__FILE__), %w{ .. lib gamertag})

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :once }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end