require 'sinatra'
require 'sinatra/reloader'
require 'artii'

get '/ascii/:word' do
  @word = params[:word]
  a = Artii::Base.new
  @result = a.asciify(@word)
  erb :ascii
end
