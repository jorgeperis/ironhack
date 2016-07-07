class SessionsController < ApplicationController
  def login
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.password == params[:user][:password]
        session[:current_user_id] = @user.id
        redirect_to products_show_path
      else
        render :text => "No valid"
      end
    else
      render :text => "No user"
    end
  end
end
