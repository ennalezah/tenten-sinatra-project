class PostsController < ApplicationController
  get '/posts/new' do
    erb :'/posts/new'
  end


end