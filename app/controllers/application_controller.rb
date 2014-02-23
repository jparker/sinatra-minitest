class ApplicationController < Sinatra::Base
  enable :sessions

  configure do
    set :root, File.expand_path(File.join('..', '..'), __dir__)
    set :views, ->{ File.join(root, 'app', 'views') }
    set :haml, escape_html: true, layout: :'layouts/application'
    set :session_secret, ENV.fetch('SESSION_SECRET')
  end

  get '/' do
    haml :'application/index'
  end

  get '/echo' do
    @data = params[:data]
    haml :'application/echo'
  end
end
