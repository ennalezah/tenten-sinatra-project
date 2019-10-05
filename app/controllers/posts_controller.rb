class PostsController < ApplicationController
  get '/posts' do
    if logged_in?
      @user = current_user
      
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
    # @post = Post.new(params)

    if !params.include?(nil)
      @post = current_user.posts.new(params)
      if @post.save
        redirect to '/posts/#{@post.id}'
      else
        redirect '/posts/new'
      end      
    end
  end

  get '/posts/:id' do
    if logged_in?
      @user = current_user
      @post = Post.find(params[:id])
      erb :'/posts/preview'
    else
      redirect '/login'
    end
  end


end