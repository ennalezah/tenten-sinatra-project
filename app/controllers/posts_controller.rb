class PostsController < ApplicationController
  get '/posts' do
    redirect '/posts/dashboard'
  end

  get '/posts/dashboard' do 
    redirect_to_login
    # @user = current_user
    @posts = Post.all
    erb :'/posts/dashboard'

    # if logged_in?
    #   @user = current_user
    #   @posts = Post.all
    #   erb :'/posts/dashboard'
    # else
    #   redirect '/login'
    # end
  end

  get '/posts/new' do
    redirect_to_login
    erb :'/posts/new'
    # if logged_in?
      
    # else
    #   redirect '/login'
    # end
  end

  # post '/posts' do
  #   if logged_in?
  #     @post = current_user.posts.new(params)
  #       if @post.save
  #         redirect "/posts/#{@post.id}"
  #       else
  #         erb :'/posts/post_error'
  #       end
  #   else 
  #     redirect '/login'
  #   end
  # end

  post '/posts' do
    redirect_to_login
    @post = current_user.posts.new(params)
    # @post = current_user.posts.new(category: params[:category], title: params[:title], description: params[:description], url: params[:url])
    if @post.save
      redirect "/posts/#{@post.id}"
    else
      erb :'/posts/post_error'
    end
    # if logged_in?
    #   @post = current_user.posts.new(params)
    #     if params.exclude?(nil) && @post.save
    #       redirect "/posts/#{@post.id}"
    #     else
    #       erb :'/posts/post_error'
    #     end
    # else 
    #   redirect '/login'
    # end
  end

  get '/posts/:id' do
    redirect_to_login
    @post = Post.find(params[:id])
    erb :'/posts/preview'
    # if logged_in?
    #   @post = Post.find(params[:id])
    #   erb :'/posts/preview'
    # else
    #   redirect '/login'
    # end
  end

  get '/posts/:id/edit' do 
    redirect_to_login
    @post = Post.find(params[:id])      
    if @post
      erb :'/posts/edit'
    else 
      redirect '/posts/dashboard'
    end
    # if logged_in?
    #   @post = Post.find(params[:id])      
    #   if @post
    #     erb :'/posts/edit'
    #   else
    #     redirect '/posts/dashboard'
    #   end
    # else
    #   redirect '/login'
    # end
  end

  patch '/posts/:id' do
    redirect_to_login
    @post = Post.find(params[:id])        
    if @post
      redirect "/posts/dashboard"
    else
      erb :'/posts/post_error'
    end
    # if logged_in?
    #   @post = Post.find(params[:id])     
    #   @post_updated = @post.update(title: params[:title], description: params[:description], url: params[:url])
      
    #   if @post_updated
    #     redirect "/posts/dashboard"
    #   else
    #     erb :'/posts/post_error'
    #   end
    # else
    #   redirect '/login'
    # end
  end

  delete '/posts/:id' do 
    redirect_to_login
    post = Post.find(params[:id])
    Post.delete(post)
    redirect '/posts/dashboard'
    # if logged_in?
    #   Post.delete(post)
    #   redirect '/posts/dashboard'
    # else
    #   redirect '/login'
    # end
  end

end