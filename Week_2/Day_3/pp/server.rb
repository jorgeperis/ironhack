require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/password.rb'

get '/' do
  erb:home
end

post '/validate' do
  password = params[:password]
  email = params[:email]
  if PasswordChecker.new(email,password).check_password
    redirect to ('/congrats')
  else
    redirect to ('/')
  end
end

get '/congrats' do
erb:congrats
end
