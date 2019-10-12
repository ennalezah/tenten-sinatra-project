class PostsController < ApplicationController
  get '/posts' do
    redirect '/posts/dashboard'
  end

  get '/posts/dashboard' do 
    redirect_to_login
    @posts = Post.all
    erb :'/posts/dashboard'
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
  end

  post '/posts' do
    redirect_to_login
    @post = current_user.posts.new(params)

    if @post.save
      redirect "/posts/#{@post.id}"
    else
      erb :'/posts/new_post_error'
    end
  end

  get '/posts/:id' do
    redirect_to_login
    @post = Post.find(params[:id])
    erb :'/posts/preview'
  end

  get '/posts/:id/edit' do 
    redirect_to_login
    @post = Post.find(params[:id])      
    if @post
      erb :'/posts/edit'
    else 
      redirect '/posts/dashboard'
    end
  end

  patch '/posts/:id' do
    redirect_to_login
    @post = Post.find(params[:id]) 
    
    if @post.update(location_name: params[:location_name], description: params[:description], url: params[:url], category: params[:category])
      redirect "/posts/dashboard"
    else
      erb :'/posts/edit_post_error'
    end
  end

  delete '/posts/:id' do 
    redirect_to_login
    post = Post.find(params[:id])
    Post.delete(post)
    redirect '/posts/dashboard'
  end
end