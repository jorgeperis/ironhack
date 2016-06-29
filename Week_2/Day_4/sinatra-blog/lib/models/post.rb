class Post
  attr_reader :date,:title,:text,:author,:category
  def initialize(title,date,text,author = "Jorge",category = "Internet")
    @title = title
    @date = date
    @text = text
    @author = author
    @category = category
  end
end

class Sponsored < Post

end
