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
      # @user = current_user
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
          erb :'/posts/post_error'
        end
    else 
      redirect '/login'
    end
  end

  get '/posts/:id' do
    if logged_in?
      @post = Post.find(params[:id])
      erb :'/posts/preview'
    else
      redirect '/login'
    end
  end

  get '/posts/:id/edit' do 
    if logged_in?
      @post = Post.find(params[:id])      
      if @post
        erb :'/posts/edit'
      else
        redirect '/posts/dashboard'
      end
    else
      redirect '/login'
    end
  end

  patch '/posts/:id' do
    if logged_in?
      @post = Post.find(params[:id])     
      @post_updated = @post.update(title: params[:title], description: params[:description], url: params[:url])
      
      if @post_updated
        redirect "/posts/dashboard"
      else
        erb :'/posts/post_error'
      end
    else
      redirect '/login'
    end
  end

  delete '/posts/:id' do 
    post = Post.find(params[:id])
    if logged_in?
      Post.delete(post)
      redirect '/tweets'
    else
      redirect '/login'
    end
  end

end