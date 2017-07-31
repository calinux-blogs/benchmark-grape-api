require 'rubygems'
require 'bundler'

Bundler.require :default, ENV['RACK_ENV'] || 'development'
ActiveRecord::Base.logger.level = Logger::INFO if ENV['RACK_ENV'] == 'production'

require 'active_support/all'

require_all 'lib', 'app/models', 'app/views', 'app/controllers'
Dir.glob('config/initializers/**/*.rb').each { |i| load i }
