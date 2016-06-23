require "./lib/models/blog.rb"
require 'date'
require 'rspec'

describe Blog do
  before(:each) do
    @blog = Blog.new("Jorge",5)
    @post1 = Post.new("Title1",Date.new(2016,06,14),"Text1")
    @post2 = Post.new("Title2",Date.new(2016,06,17),"Text2")
    @blog.add_post(@post1)
    @blog.add_post(@post2)
  end

  it "#content returns a list of posts" do
    expect(@blog.posts).to eq([@post1,@post2])
  end

  it "#create_hash_of_content returns a hash with posts pagination" do
    expect(@blog.create_hash_of_content).to eq({1 => [@post2,@post1]})
  end

  it "#number_pages_array returns an array with the pages" do
    expect(@blog.number_pages_array).to eq([1])
  end

end
