

class BidController < ApplicationController

  def create
    @user = User.find_by(email: params[:bid][:user_id])
    @product = Product.find_by(id: params[:bid][:product_id])
    @bid = Bid.new(amount: params[:bid][:amount], user: @user, product: @product)

      if @bid.valid? && @product.user != @user
        @bid.save
        redirect_to "/products/#{@product.id}"
      else
        render :text => "Error bid"
    end
  end
end
