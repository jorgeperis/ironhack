require 'colorize'
require 'date'
class Blog
  def initialize(name)
    @name = name
    @post_hash ={}
    @content =[]
  end

  def add_post(post)
    @content.push(post)
  end

  def publish_post(page)

    puts "\n\n"
    @post_hash[page].each do |x|
      x.view
    end

    pages.each do |x|
      if x == page
        print "#{x} ".colorize(:blue)
      else
        print "#{x} "
      end
    end
    puts "\n\n"
    puts "<- Prev       Next ->"
    
    ans = gets.chomp
    if ans.upcase == "NEXT"
      if @post_hash[page+1]
        publish_post(page+1)
      else
        publish_post(1)
      end
    elsif ans.upcase == "PREV"
      if @post_hash[page-1]
        publish_post(page-1)
      else
        publish_post(5)
      end
    end
  end

  def pages
    modul = @content.length % 3
    if modul == 0
      page = @content.length/3
    else
      page = @content.length/3 + 1
    end
    i=1
    page_array=[]
    while i<=page do
      page_array.push(i)
      i=i+1
    end
    return page_array
  end

  def pagination
    publish_page=[]
    publish = @content.sort_by {|item| item.data}.reverse
    post_slice = publish.each_slice(3).to_a
    pages.each_with_index do |item,i|
    @post_hash[item] = post_slice[i]
    end
  end
end

class Post
  attr_reader :data
  def initialize(title,data,text)
    @title = title
    @data = data
    @text = text
  end

  def view
    puts "#{@title}                #{@data}"
    puts "***************"
    puts @text
    puts "---------------\n\n\n"
  end
end

class Sponsored < Post
  def view
    puts "******#{@title}******    #{@data.to_s}"
    puts "***************"
    puts @text
    puts "---------------\n\n\n"
  end
end

blog = Blog.new("MyBlog")
blog.add_post Post.new("Title1",Date.new(2016,06,14),"Text1")
blog.add_post Post.new("Title2",Date.new(2016,06,01),"Text2")
blog.add_post Sponsored.new("Title3",Date.new(2016,06,02),"Text3")
blog.add_post Post.new("Title4",Date.new(2016,06,13),"Text4")
blog.add_post Post.new("Title5",Date.new(2016,06,03),"Text5")
blog.add_post Sponsored.new("Title6",Date.new(2016,06,12),"Text6")
blog.add_post Sponsored.new("Title7",Date.new(2016,06,04),"Text7")
blog.add_post Post.new("Title8",Date.new(2016,06,11),"Text8")
blog.add_post Post.new("Title9",Date.new(2016,06,05),"Text9")
blog.add_post Sponsored.new("Title10",Date.new(2016,06,10),"Text10")
blog.add_post Post.new("Title11",Date.new(2016,06,06),"Text11")
blog.add_post Post.new("Title12",Date.new(2016,6,9),"Text12")
blog.add_post Post.new("Title13",Date.new(2016,6,7),"Text13")
blog.add_post Post.new("Title14",Date.new(2016,6,8),"Text14")

blog.pagination
blog.publish_post(1)
