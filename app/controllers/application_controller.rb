require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
    enable :sessions
  end

  get '/' do
    erb :index
  end

  get '/signup' do 
    erb :'/users/signup'
  end

  # get '/signup/error'
  #   erb :'/users/signup_error'
  # end

  post '/signup' do
    @user = User.create(params)

    if @user.save
      session[:user_id] = @user.id
      redirect '/dashboard'
    else 
      erb :'/users/signup_error'
    end
  end



  get '/login' do
    erb :'/users/login'
  end

  post '/login' do 
    @user = User.find(params[:id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      redirect '/login'
    end
  end

  get '/dashboard' do 
    if logged_in?
      erb :'/users/dashboard'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  # Helper Methods
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end