# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require :default, :development
Dotenv.load

DB_USERNAME = ENV['DB_USERNAME']
DB_PASSWORD = ENV['DB_PASSWORD']
DATABASE_NAME = 'twitty_dev'

namespace :db do
  task :create do
    db = Sequel.connect(
      adapter: :postgres,
      host: 'localhost',
      database: 'postgres',
      user: DB_USERNAME,
      password: DB_PASSWORD
    )
    db.run("create database #{DATABASE_NAME};")
    db.run("grant all privileges on database #{DATABASE_NAME} to #{DB_USERNAME};")
  end

  task :drop do
    db = Sequel.connect(
      adapter: :postgres,
      host: 'localhost',
      database: 'postgres',
      user: DB_USERNAME,
      password: DB_PASSWORD
    )
    db.run("drop database #{DATABASE_NAME};")
  end

  task :migrate, [:version] do |t, args|
    db = Sequel.connect(
      adapter: :postgres,
      host: 'localhost',
      database: DATABASE_NAME,
      user: DB_USERNAME,
      password: DB_PASSWORD
    )
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel::Migrator.run(db, 'config/db/migrations', target: version)
  end

  task :seed do
    Sequel::Model.db = Sequel.connect(
      adapter: :postgres,
      host: 'localhost',
      database: DATABASE_NAME,
      user: DB_USERNAME,
      password: DB_PASSWORD
    )
    require_all 'models'

    100.times do
      username = Faker::Name.unique.name
      email = Faker::Internet.unique.email
      password = '111111'
      User.create(username: username, email: email, password: password)
    end
  end
end