
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    @articles = Article.all
    # erb :show
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.all.find_by(id: params[:id])
    # binding.pry
    erb :show
  end

  get '/articles/:id/edit' do
    # binding.pry
    @article = Article.all.find_by(id: params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    @article = Article.all.find_by(id: params[:id])
    @article.update(params["article"])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.all.find_by(id: params[:id])
    @article.destroy
    erb :index
  end

end
