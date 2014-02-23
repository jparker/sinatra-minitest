class EchoController < ApplicationController
  get '/' do
    session[:data] = CircleBuffer.new(5)
    haml :'echo/index'
  end

  post '/' do
    session[:data].unshift(params[:data])
    @data = session[:data]
    haml :'echo/index'
  end
end
