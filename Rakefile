# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require :default
Dotenv.load

DATABASE_NAME = 'twitty_dev'
USERNAME = ENV['DB_USERNAME']
PASSWORD = ENV['DB_PASSWORD']

task :db_create do
  db = Sequel.connect(
    adapter: :postgres,
    host: 'localhost',
    database: 'postgres',
    user: USERNAME,
    password: PASSWORD
  )
  db.run("create database #{DATABASE_NAME};")
  db.run("grant all privileges on database #{DATABASE_NAME} to #{USERNAME};")
end

task :db_drop do
  db = Sequel.connect(
    adapter: :postgres,
    host: 'localhost',
    database: 'postgres',
    user: USERNAME,
    password: PASSWORD
  )
  db.run("drop database #{DATABASE_NAME};")
end