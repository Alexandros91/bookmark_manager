require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.see
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  # Need to get title and url into database.
  post '/entry' do
    @title = params[:entry_title]
    @url = params[:entry_url]
  end

  run! if app_file == $0
end
