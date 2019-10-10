class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    if @user      
      erb :'/users/profile'
    else
      erb :'/users/profile_not_found'
    end
  end 

  get '/users/profile-not-found' do
    erb :'/users/profile_not_found'
  end
end