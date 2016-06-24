require './server'
require 'rspec'
require 'rack/test'
require 'pry'

describe 'Server Service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do

    it 'returns 200 OK' do
      get '/'
      expect(last_response).to be_ok
      # expect(last_response.status.ok?).to be_truthy  is the same that previous line, is best the previous line
    end

    it "includes Title5" do
      get '/'
      expect(last_response.body).to include ("Title9")
    end
  end

  describe 'GET /new_post' do
    it "returns 200 ok" do
      get '/new_post'
      expect(last_response).to be_ok
    end
end

  describe 'GET /post_details/:page/:index' do

    it 'returns an author include' do
      get '/post_details/:page/:index'
      expect(last_response.body).to include ("Author")
    end
  end

  describe 'POST /new_post' do
    it "redirects to '/'" do
      post '/new_post'
      expect(last_response.redirect?).to be(true)
      # expect(last_response).to be_redirect is the same that the previous line,the previous line is best
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end

  describe 'POST /post_details/:page/:index' do
    it "redirects to '/post_details/:page/:index'" do
      post '/post_details/:page/:index'
      expect(last_response.redirect?).to be(true)
      # expect(last_response).to be_redirect is the same that the previous line,the previous line is best
      follow_redirect!
      expect(last_request.path).to eq('/post_details/:page/:index')
    end
  end


  describe 'POST /pages' do

    it "redirects to '/'" do
      params = {}
      params["prevornext"] = "next"
      params["page"] = 1
      @blog = Blog.new("Jorge",2)
      @post1 = Post.new("Title1",Date.new(2016,06,14),"Text1")
      @post2 = Post.new("Title2",Date.new(2016,06,17),"Text2")
      @post3 = Post.new("Title5",Date.new(2016,06,12),"Text5")
      @blog.add_post(@post1)
      @blog.add_post(@post2)
      @blog.add_post(@post3)

      post '/pages'
      expect(last_response.redirect?).to be(true)
      follow_redirect!
      expect(last_request.path).to eq('/')
    end


    it "redirects to '/'" do
      params = {}
      params["prevornext"] = "pre"
      params["page"] = 2
      @blog = Blog.new("Jorge",2)
      @post1 = Post.new("Title1",Date.new(2016,06,14),"Text1")
      @post2 = Post.new("Title2",Date.new(2016,06,17),"Text2")
      @post3 = Post.new("Title5",Date.new(2016,06,12),"Text5")
      @blog.add_post(@post1)
      @blog.add_post(@post2)
      @blog.add_post(@post3)
      post '/pages'
      
      expect(last_response.redirect?).to be(true)
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
