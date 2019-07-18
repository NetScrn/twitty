# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

module Twitty
  MODE = ENV['ENVIRONMENT'] || :development
  Bundler.require :default, MODE
  Dotenv.load

  Sequel::Model.db = Sequel.connect(
    adapter: :postgres,
    host: 'localhost',
    database: 'twitty_dev',
    user: ENV.fetch('DB_USERNAME'),
    password: ENV.fetch('DB_PASSWORD')
  )

  require_all 'api'
  require_all 'models'
end