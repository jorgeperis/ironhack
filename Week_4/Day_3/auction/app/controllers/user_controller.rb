class UserController < ApplicationController

  def show
    @users = User.all
  end

  def create
    @user = User.new(name: params[:user][:name],email: params[:user][:email])
    if @user.valid?
      @user.save
      redirect_to users_show_path
    else
      render :text => "e-mail has already been taken"
    end

  end

  def destroy
    
  end

  def new
    @user = User.new
  end
end
