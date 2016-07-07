class ProductController < ApplicationController

  def info
    @product = Product.find_by(id: params[:id])
    @bids = Bid.where(product: @product)
    @bid = Bid.new
    @timeto = (@product.deadline - DateTime.now)
    @mm, @ss = @timeto.divmod(60)
    @hh, @mm = @mm.divmod(60)
    @dd, @hh = @hh.divmod(24)
    @bestbid = @bids.order(amount: :desc).first
  end

  def show
    @products = Product.all
  end

  def create
    @user = User.find_by(email: params[:product][:user_id])
    @product = Product.new(title: params[:product][:title],
                            description: params[:product][:description],
                            deadline: params[:product][:deadline],
                            user: @user)
    if @product.valid?
      @product.save
      redirect_to products_show_path
    else
      render :text => "Introduce all inputs"
    end
  end

  def destroy
    #code
  end

  def new
    @product = Product.new
  end
end
