require 'rspec'

require 'gamertag'


require 'webmock/rspec'
WebMock.disable_net_connect!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub_get(url)
  stub_request(:get, xboxleaders_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
 File.read(fixture_path + '/' + file)
end

def json_response(file)
  {
    :body => fixture(file),
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end

def xboxleaders_url(url)
  "https://www.xboxleaders.com/api/2.0#{url}"
end