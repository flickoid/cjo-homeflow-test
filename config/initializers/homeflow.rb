require 'homeflow/api'
require 'dry_ice'

Homeflow::API.configure do |config|
  config.api_key = ENV['HOMEFLOW_API_KEY']
  config.source = 'http://index1.homeflow.co.uk'
end

module Homeflow
  module API
    class Request
      include HTTParty::DryIce
      cache Rails.cache, {:serialize => false}
    end
  end
end
