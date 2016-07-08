class UsersController < ApplicationController
  def show
    @comments = Comment.where(user_id: params[:userid])
  end
end
