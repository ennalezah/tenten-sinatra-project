class PostsController < ApplicationController
  get '/posts' do
    redirect '/posts/dashboard'
  end

  get '/posts/dashboard' do 
    if logged_in?
      @user = current_user
      @posts = Post.all
      @users = User.all
      erb :'/posts/dashboard'
    else
      redirect '/login'
    end
  end

  get '/posts/new' do
    if logged_in?
      erb :'/posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    if logged_in?     
      @post = Post.new(params)
        if @post.save
          redirect "/posts/#{@post.id}"
        else
          erb :'/posts/new_post_error'
        end
    else 
      redirect '/login'
    end
  end

  get '/posts/:id' do
    if logged_in?
      @post = Post.find(params[:id])
      @post.user = current_user
      erb :'/posts/preview'
    else
      redirect '/login'
    end
  end


end