ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join(__dir__, '..', 'config', 'application.rb'))

require 'minitest/autorun'
require 'rack/test'
require 'capybara'

module AcceptanceTest
  include Capybara::DSL

  def self.included(_)
    Capybara.app, _ = Rack::Builder.parse_file(File.expand_path(File.join(__dir__, '..', 'config.ru')))
  end
end
