class Post
  attr_reader :date,:title,:text
  def initialize(title,date,text)
    @title = title
    @date = date
    @text = text
  end
end

class Sponsored < Post
  
end
