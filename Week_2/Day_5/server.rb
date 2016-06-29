require 'sinatra'
require 'sinatra/reloader'
require './lib/models/films.rb'
require 'pry'

question = []
selected_movies = []
text = ''

get '/' do
  erb :home
end

post '/search' do
  text = params["text"]
  redirect to '/movies'
end

get '/movies' do
  selected_movies = Movies.getmovies(text)
  @films = selected_movies
  question = chooseQuestions(selected_movies)
  @question = question
  erb :movies
end

get '/answer/:idfilm' do
  selected_movie = selected_movies.select {|movie| movie.id == params[:idfilm]}

  if selected_movie[0].id == question[0]
    redirect to '/correct'
  else
    redirect to '/incorrect'
  end
end

get '/correct' do
  erb :correct
end

get '/incorrect' do
  erb :incorrect
end
