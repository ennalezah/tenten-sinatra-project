class PostsController < ApplicationController
  get '/posts' do
    redirect '/posts/dashboard'
  end

  get '/posts/dashboard' do 
    redirect_to_login
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

  get '/posts/attractions' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Attraction"}
    erb :'/posts/attractions'
  end

  get '/posts/bars' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Bar"}
    erb :'/posts/bars'
  end

  get '/posts/beauty-and-spas' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Beauty/Spa"}
    erb :'/posts/beauty_and_spas'
  end

  get '/posts/cafes-and-bakeries' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Cafe/Bakery"}
    erb :'/posts/cafes_and_bakeries'
  end

  get '/posts/museums' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Museum"}
    erb :'/posts/museums'
  end

  get '/posts/nightlife' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Nightlife"}
    erb :'/posts/nightlife'
  end

  get '/posts/parks-and-recreation' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Park/Recreation"}
    erb :'/posts/parks_and_recreation'
  end

  get '/posts/restaurants' do
    redirect_to_login
    @posts = Post.all.select {|p| p[:category] == "Restaurant"}
    erb :'/posts/restaurants'
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
    if @post.update(title: params[:title], description: params[:description], url: params[:url], category: params[:category])
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