class CommentsController < ApplicationController
  def create
    @concert = Concert.find_by_id(params[:id])
    @concert.comments.create(text_comment: params[:comment][:text_comment])
    @concert.count_comments = @concert.comments.size
    @concert.save
    redirect_to "/concerts/#{params[:id]}/details"
  end
end
