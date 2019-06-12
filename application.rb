require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']
Dotenv.load

require File.expand_path('api/twitty_api', __dir__)