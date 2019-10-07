class UsersController < ApplicationController

  get '/users' do 
    users = User.all 
    redirect to '/'
  end

  get '/users/:slug' do
    redirect_to_login
    @user = User.find_by_slug(params[:slug])
    erb :'/users/profile'
  end 
end