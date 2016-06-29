require "./lib/models/post.rb"
require 'date'
require 'rspec'

describe Post do
  before(:each) do
    @post1 = Post.new("Title1",Date.new(2016,06,14),"Text1")
  end

  it "#title returns title" do
    expect(@post1.title).to eq("Title1")
  end

  it "#Date returns date" do
    expect(@post1.date).to eq(Date.new(2016,06,14))
  end

  it "#Text returns text" do
    expect(@post1.text).to eq("Text1")
  end
end
