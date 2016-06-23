require 'sinatra'
require 'sinatra/reloader'
require 'colorize'
require './lib/models/blog.rb'
require './lib/models/post.rb'
require 'pry'

blog = Blog.new("Jorge",5)
blog.add_post Post.new("Title1",Date.new(2016,06,14),"Text1")
blog.add_post Post.new("Title2",Date.new(2016,06,01),"Text2")
blog.add_post Sponsored.new("Title3",Date.new(2016,06,02),"Text3")
blog.add_post Post.new("Title4",Date.new(2016,06,13),"Text4")
blog.add_post Post.new("Title5",Date.new(2016,06,03),"Text5")
blog.add_post Sponsored.new("Title6",Date.new(2016,06,12),"Text6")
blog.add_post Sponsored.new("Title7",Date.new(2016,06,04),"Text7")
blog.add_post Post.new("Title8",Date.new(2016,06,11),"Text8")
blog.add_post Post.new("Title9",Date.new(2016,06,05),"Text9")
page = 1

get '/' do
  @number_pages = blog.number_pages_array
  @posts = blog.post_hash
  @page = page
  @blogname = blog.name
  erb :home
end

post '/pages' do
  @posts = blog.post_hash
  page = params["page"].to_i

  if params["prevornext"] == "next"
    if @posts[page+1]
      page += 1
      redirect to '/'
    else
      redirect to '/'
    end
  elsif params["prevornext"] == "pre"
    if @posts[page-1]
       page -= 1
       redirect to '/'
    else
      redirect to '/'
    end
  end
end
