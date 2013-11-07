require 'sinatra/base'
require_relative '../server'
 
class BookmarkManager < Sinatra::Base

set :views, File.join(File.dirname(__FILE__), '..', 'views')

enable :sessions
set :session_secret, 'secret_session'

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
    tags = params["tags"].split(",").map do |tag|
      Tag.first_or_create(:text => tag.strip)
    end
    Link.create(:name => name, :url => url, :description => description, :tags => tags)
    redirect to('/')
  end


  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = Link.all.select {|link| link.tags.include? tag} 
    erb :tags
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:email => params[:email], 
                :password => params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end


helpers do

  def current_user    
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end



  run! if app_file == $0
end