require 'pry'

class ShoppingCart
  def initialize(items)
    @products = []
    @count = {}
    @reduce = {}
    @items = items
    @discount = {}
  end

  def add_item_to_cart(product)
    @products.push([1,product,@items[product]])
  end

  def show
    @reduce.each do |key,value|
      if @count[key] > 1
        product = (key.to_s + "s").to_sym
      else
        product = key
      end
      puts "#{@count[key]} #{product.to_s}:  #{@reduce[key]}"
    end
  end

  def cost
    price = 0
    @reduce.each do |key,value|
      price += value
    end
    puts price
  end

  def count_products

    @products.each do |x|
      if @count[x[1]] == nil
        @count[x[1]] = x[0]
      else
        @count[x[1]] += x[0]
      end

      if @reduce[x[1]] == nil
        @reduce[x[1]] = x[2]
      else
        @reduce[x[1]] += x[2]
      end
    end
  end

  def discounts

    if @count[:apple] >= 2
      @discount[:apple] = -(@reduce[:apple] / 2)
    end

    if @count[:oranges] >= 3
      @discount[:oranges] = -(2*(@reduce[:apple] / 3))
    end

    if @count[:grapes] >= 4
      @products.push([(@count[:grapes]/4),:banana,@items[:banana]])
      count_products
    end
  end
end




items = {:apple => 10,:oranges => 5,:grapes => 15,:banana => 20,:watermelon => 50}



cart = ShoppingCart.new(items)

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.count_products
cart.show
cart.cost
