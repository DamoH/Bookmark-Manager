require 'sinatra/base'
require './lib/bookmark'

# this is the controller class
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    'Bookmark-manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  # post '/bookmarks' do
  #   p "Form data submitted to the /bookmarks route!"
  # end

  post '/bookmarks' do
    p "******"
    p "post bookmarks"
    url = params['url']
    p url
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
    redirect '/bookmarks'
  end
  run! if app_file == $0
end
