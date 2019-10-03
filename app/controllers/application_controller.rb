require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
    enable :sessions
  end

  get "/" do
    erb :index
  end

  get '/signup' do 
    erb :'/users/signup'
  end

end
