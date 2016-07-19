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
    if @bestbid
      if @bestbid.amount > @product.minimun_bid
        @minimunbid = @bestbid.amount
      else
        @minimunbid = @product.minimun_bid
      end
    else
      @minimunbid = @product.minimun_bid
    end
    @review = Review.new
  end

  def show
    @products = Product.all
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    @product = Product.new(title: params[:product][:title],
                            description: params[:product][:description],
                            deadline: params[:product][:deadline],
                            minimun_bid: params[:product][:minimun_bid],
                            user: @user)
    if @product.valid?
      @product.save
      redirect_to products_show_path
    else
      render :text => "Introduce all inputs"
    end
  end

  def destroy
    Product.find(params[:product_id]).destroy
    redirect_to products_show_path
  end

  def new
    @product = Product.new
  end
end
