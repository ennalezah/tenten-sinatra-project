require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret_password"
    enable :sessions
  end

  get '/' do
    if logged_in?
      redirect '/posts/dashboard'
    end
    
    erb :index
  end

  get '/signup' do 
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      redirect '/posts/dashboard'
    else 
      erb :'/users/signup_error'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do 
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/posts/dashboard'
    else
      erb :'/users/login_error'
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

    def redirect_to_login
      if !logged_in? || current_user.nil?
        session.clear
        redirect '/login' 
      end
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end