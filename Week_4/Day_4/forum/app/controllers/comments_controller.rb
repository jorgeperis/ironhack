class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @movie = Movie.find(params[:movieid])
  end
  def create
    @movie = Movie.find(params[:movieid])
    @user = User.find(session[:current_user_id])
    @comment = Comment.create(user: @user,text: params[:comment][:text],movie: @movie)
    redirect_to "/info/#{@movie.id}"
  end
end
