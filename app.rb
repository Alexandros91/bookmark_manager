require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.see
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  # Need to get title and url into database.
  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'  
  # @title = params[:entry_title]
    # @url = params[:entry_url]
  end

  run! if app_file == $0
end
