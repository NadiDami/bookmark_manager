require 'sinatra/base'
require_relative '../server'
 
class BookmarkManager < Sinatra::Base

set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/addlink' do
    erb :add_link
  end

  post '/addlink' do
    name = params["name"]
    url = params["url"]
    description = params["description"]
    Link.create(:name => name, :url => url, :description => description)
    redirect to('/')
  end


  run! if app_file == $0
end