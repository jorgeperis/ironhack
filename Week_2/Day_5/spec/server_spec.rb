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
    end


    it "includes Movies Posters" do
      get '/movies'
      expect(last_response.body).to include ("Movies Posters")
    end

    it 'returns 200 OK' do
      get '/correct'
      expect(last_response).to be_ok
    end

    it 'returns 200 OK' do
      get '/incorrect'
      expect(last_response).to be_ok
    end
  end


  describe 'POST /search' do

    it "redirects to '/movies'" do

      post '/search'
      expect(last_response.redirect?).to be(true)
      follow_redirect!
      expect(last_request.path).to eq('/movies')
    end
  end
end
#
