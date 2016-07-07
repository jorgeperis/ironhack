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

  def manage
    @products = Product.where(:user_id => session[:current_user_id])
    @bids = Bid.where(:user_id => session[:current_user_id])
    @finishedproducts = Product.where("deadline < ?", DateTime.now)
    @won = []
    @finishedproducts.each do |finishedproduct|
      @winnerbid = Bid.where(product: finishedproduct).order(amount: :desc).first
      if @winnerbid.user_id == session[:current_user_id]
        @won.push(@winnerbid.product)
      end
    end


  end

  def new
    @user = User.new
  end
end
