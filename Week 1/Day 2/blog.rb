class Blog
  def initialize(name)
    @name = name
    @content = []
  end

  def add_post(post)
    @content.push(post)
  end

  def publish_post(publish)
    publish.each do |x|
      if x.sponsored
        spon = "******#{x.title}******    #{x.data}"
      else
        spon = "#{x.title}                #{x.data}"
      end

      puts spon
      puts "***************"
      puts x.text
      puts "---------------\n\n\n"
    end

    i=1
    while i<=pages do
      print "#{i}  "
      i=i+1
    end
    puts "\n\n\n"
  end

  def pages
    modul = @content.length % 3
    if modul == 0
      page = @content.length/3
    else
      page = @content.length/3 + 1
    end
    return page
  end

  def pagination(start)
    publish_page=[]
    publish = @content.sort_by {|item| item.data}.reverse
    publish.each_with_index do |item,i|
      if i == start
        publish_page.push(publish[i])
        publish_page.push(publish[i+1])
        publish_page.push(publish[i+2])
        @last = i+2
      end
    end
    publish_post(publish_page)
  end
end

class Post
  attr_reader :title,:data,:text,:sponsored
  def initialize(title,data,text,sponsored=false)
    @title = title
    @data = data
    @text = text
    @sponsored = sponsored
  end
end

blog = Blog.new("MyBlog")
blog.add_post Post.new("Title1","20160614","Text1")
blog.add_post Post.new("Title2","20160601","Text2")
blog.add_post Post.new("Title3","20160602","Text3")
blog.add_post Post.new("Title4","20160613","Text4",true)
blog.add_post Post.new("Title5","20160603","Text5")
blog.add_post Post.new("Title6","20160612","Text6")
blog.add_post Post.new("Title7","20160604","Text7")
blog.add_post Post.new("Title8","20160611","Text8",true)
blog.add_post Post.new("Title9","20160605","Text9")
blog.add_post Post.new("Title10","20160610","Text10")
blog.add_post Post.new("Title11","20160606","Text11")
blog.add_post Post.new("Title12","20160609","Text12",true)
blog.add_post Post.new("Title13","20160607","Text13")
blog.add_post Post.new("Title14","20160608","Text14")

blog.pagination(0)
