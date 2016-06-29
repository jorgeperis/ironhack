require "./lib/models/blog.rb"
require 'date'
require 'rspec'

describe Blog do
  before(:each) do
    @blog = Blog.new("Jorge",2)
    @post1 = Post.new("Title1",Date.new(2016,06,14),"Text1")
    @post2 = Post.new("Title2",Date.new(2016,06,17),"Text2")
    @post3 = Post.new("Title5",Date.new(2016,06,12),"Text5")
    @blog.add_post(@post1)
    @blog.add_post(@post2)
    @blog.add_post(@post3)
  end

  it "#content returns a list of posts" do
    expect(@blog.posts).to eq([@post1,@post2,@post3])
  end

  it "#create_hash_of_content returns a hash with posts pagination" do
    expect(@blog.create_hash_of_content).to eq({1 => [@post2,@post1],2 => [@post3]})
  end

  it "#number_pages_array returns an array with the pages" do
    expect(@blog.number_pages_array).to eq([1,2])
  end

  it "#add_post return an array of posts" do
    expect(@blog.add_post(@post3)).to include(@post3)
  end

  it "#next_or_previous return the next page to go" do
    expect(@blog.next_or_previous("next",1)).to eq(2)
  end

  it "#next_or_previous return the previous page to go" do
    expect(@blog.next_or_previous("pre",2)).to eq(1)
  end

end
