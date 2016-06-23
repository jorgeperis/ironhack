
class Blog
attr_reader :posts, :post_hash, :name
  def initialize(name,post_per_page)
    @name = name
    @post_hash ={}
    @posts =[]
    @post_per_page = post_per_page
  end

  def add_post(post)
    @posts.push(post)
    create_hash_of_content
  end

  def prevORnext(page)

    answer = gets.chomp

    if answer.upcase == "NEXT" || answer.upcase == "N"
      if @post_hash[page+1]
        publish(page+1)
      else
        publish(page)
      end
    elsif answer.upcase == "PREV" || answer.upcase == "P"
      if @post_hash[page-1]
        publish(page-1)
      else
        publish(page)
      end
    end

  end

  def number_pages_array
    reminder = @posts.length % @post_per_page

    if reminder == 0
      page = @posts.length/@post_per_page
    else
      page = @posts.length/@post_per_page + 1
    end

    i=1
    page_array=[]

    while i<=page do
      page_array.push(i)
      i += 1
    end

    return page_array
  end

  def create_hash_of_content

    orderer_posts = @posts.sort_by {|item| item.date}.reverse
    sliced_posts = orderer_posts.each_slice(@post_per_page).to_a

    number_pages_array.each_with_index do |item,i|
      @post_hash[item] = sliced_posts[i]
    end

  return @post_hash
  end
end
