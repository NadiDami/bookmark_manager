require 'sinatra/base'
require 'rack-flash'
require_relative '../server'
 
class BookmarkManager < Sinatra::Base

use Rack::Flash

set :views, File.join(File.dirname(__FILE__), '..', 'views')

enable :sessions
set :session_secret, 'secret_session'


  get '/' do
    if session[:logout]
      flash[:notice] = "Goodbye!"
      session.clear
    end
    @links = Link.all
    erb :index
  end

  get '/addlink' do
    erb :add_link, :layout => !request.xhr?
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
    @user = User.new
    erb :"users/new"
  end

 post '/users' do
  @user = User.new(:email => params[:email], 
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])  
  if @user.save
  session[:user_id] = @user.id
  redirect to('/')
  else
  flash.now[:errors] = @user.errors.full_messages
  erb :"users/new"
  end
end

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password are incorrect"]
    erb :"sessions/new"
  end
end

post '/logout' do
  session.clear
  session[:logout] = true
  redirect to('/')
end


helpers do

  def current_user    
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end



  run! if app_file == $0
end