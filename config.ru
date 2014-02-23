require File.join(__dir__, 'config', 'application.rb')

map('/echo') { run EchoController }
map('/') { run ApplicationController }
