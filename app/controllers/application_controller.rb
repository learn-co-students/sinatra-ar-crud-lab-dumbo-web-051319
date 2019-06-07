require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
      erb :index
  end

  get '/articles/new' do
     erb :new
  end

  post '/articles' do
    Article.create(params)
    last_id = Article.all.last.id
    # binding.pry
    redirect "/articles/#{last_id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.update(params["article"])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    # binding.pry
    @article.destroy
    redirect "/"
  end
end
