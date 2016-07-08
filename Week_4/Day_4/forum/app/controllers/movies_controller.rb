
class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def search
    @movieSearch = Movie.where(title: params[:movie])
    if @movieSearch.empty?
      moviesSearch = Imdb::Search.new(params[:movie])
      @movieslimit20 = []

      moviesSearch.movies.each_with_index do |movie|

        @movieslimit20.push(movie) if movie.poster != nil

        return render 'show' if @movieslimit20.length == 20

      end
    else
      redirect_to "/info/#{@movieSearch.first.id}"
    end
  end

  def info
    @movie = Movie.find(params[:id])
  end

  def create
    if Movie.find(params[:movieid])
      @movie = Movie.find(params[:movieid])
    else
      movie = Imdb::Movie.new(params[:movieid])
      @movie = Movie.new
      @movie.title = movie.title
      @movie.poster = movie.poster
      @movie.year = movie.year
      @movie.plot_summary = movie.plot_summary
      @movie.save
    end
    redirect_to "/info/#{@movie.id}"
  end
end
