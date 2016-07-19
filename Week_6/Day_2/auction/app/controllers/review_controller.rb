class ReviewController < ApplicationController
  def create
    review = Review.new
    review.description = params[:review][:description]
    review.user_id = params[:review][:user_id]
    review.product_id = params[:review][:product_id]
    review.save
    redirect_to "/products/#{review.product_id}"
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end
  def patch
    review = Review.find_by(id: params[:review][:id])
    review.description = params[:review][:description]
    review.save
    redirect_to "/products/#{review.product_id}"
  end
end
