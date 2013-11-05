require 'sinatra/base'
require_relative '../server'
 
class BookmarkManager < Sinatra::Base

set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do

    erb :index
  end

  post '/' do
    erb :index 
  end

end