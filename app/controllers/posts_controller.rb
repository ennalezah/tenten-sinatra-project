class PostsController < ApplicationController
  get '/posts/new' do
    if logged_in?(session)
      erb :'/posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    if !params.empty?
      erb: '/posts/preview'
    else
      redirect '/posts/new'
    end
  end


end