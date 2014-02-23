require File.join(__dir__, 'config', 'application.rb')

map('/') { run ApplicationController }
