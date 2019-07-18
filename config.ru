# frozen_string_literal: true

require './config/loader'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'localhost'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete]
  end
end

run TwittyAPI.new
