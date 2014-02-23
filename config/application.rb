RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)

require 'dotenv'
Dotenv.load(
  File.join(__dir__, '..', '.env'),
  File.join(__dir__, '..', ".#{RACK_ENV}.env")
)

require 'sinatra/base'
require 'haml'
require 'sass'

Dir[File.expand_path(File.join(__dir__, '..', 'app', 'controllers', '*.rb'))].each { |f| require f }
Dir[File.expand_path(File.join(__dir__, '..', 'app', 'models', '*.rb'))].each { |f| require f }
