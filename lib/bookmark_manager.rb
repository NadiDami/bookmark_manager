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
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create(:name => name, :url => url, :description => description, :tags => tags)
    redirect to('/')
  end


#   get '/tags/:text' do
#   tag = Tag.first(:text => params[:text])
#   @links = Link.all
#   @links.each do |link|
#     return link if link.tags include tag.text
#   end
#   erb :index
# end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @links = Link.all.select {|link| link.tags.include? tag} 
  erb :index
end


  run! if app_file == $0
end