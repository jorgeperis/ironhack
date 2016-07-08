
class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def login
    @user = User.new
    @movie = Movie.find(params[:movieid])
  end

  def checklogin
    @user = User.find_by(username: params[:user][:username])

    if @user
      if @user.password == params[:user][:password]
        session[:current_user_id] = @user.id
        redirect_to "/info/#{params[:movieid]}"
      else
        render :text => "No valid"
      end
    else
      render :text => "No user"
    end
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
    if Movie.find_by(id: params[:id])
      @movie = Movie.find(params[:id])
      @newmovie = false
    else
      @newmovie = true
      @movie = Imdb::Movie.new(params[:id])
    end

  end

  def create
    if Movie.find_by(id: params[:movieid])
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
    redirect_to "/comments/#{@movie.id}/new"
  end
end
