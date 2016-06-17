require 'pry'


class ShoppingCart
  attr_reader :products
  def initialize(items)
    @products = []
    @count = {}
    @reduce = {}
    @items = items
    @discount = {}
    @total_discount = 0
  end

  def add_item_to_cart(product)
    @products.push([1,product,@items[product]])
  end

  def show
    count_products
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

    if @total_discount != 0
      puts "Price: #{price}$"
      puts "Discount: #{@total_discount}$"
      price = price - @total_discount
    end
    puts "Total price: #{price}$"
  end

  def count_products
    @count ={}
    @reduce = {}

    @products.each do |product_array|
      if @count[product_array[1]] == nil
        @count[product_array[1]] = product_array[0]
      else
        @count[product_array[1]] += product_array[0]
      end

      if @reduce[product_array[1]] == nil
        @reduce[product_array[1]] = product_array[2]
      else
        @reduce[product_array[1]] += product_array[2]
      end
    end
  end

  def discounts

    if @count[:apple] != nil && @count[:apple] >= 2
      @discount[:apple] = (@reduce[:apple] / 2)
      @total_discount += (@discount[:apple] / 10) * 10

    end

    if @count[:orange] != nil && @count[:orange] >= 3
      @discount[:orange] = (@reduce[:orange]/@count[:orange]) * (@count[:orange]/3).to_i
      @total_discount += @discount[:orange]
    end

    if @count[:grape] != nil &&  @count[:grape] >= 4
      @products.push([(@count[:grape]/4),:banana,@items[:banana]])
    end


  end

  def determine_season(day_year)

    case day_year
      when 81..173
        result = 0 #spring
      when 174..266
        result = 1 #summer
      when 267..355
        result = 2 #autumm
      else
        result = 3 #winter
    end

  end

  def change_prices_season_sunday(seasons,sunday,day_year,day_week)

    @products.each do |product_array|

      if seasons[product_array[1]] != nil
        product_array[2] = seasons[product_array[1]][determine_season(day_year)]
      end

      if sunday[product_array[1]] != nil && day_week == 0
          product_array[2] = sunday[product_array[1]]
      end

    end

  end

end



seasons = {:apple => [10,10,15,12],:orange => [5,2,5,5],:banana => [20,20,20,21]}
sunday = {:watermelon => 100}
items = {:apple => 10,:orange => 5,:grape => 15,:banana => 20,:watermelon => 50}



cart = ShoppingCart.new(items)
time = Time.new

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape

cart.change_prices_season_sunday(seasons,sunday,180,time.wday)
cart.count_products
cart.discounts
cart.show
cart.cost










# puts "Current Time : " + time.inspect
# puts time.year    # => Year of the date
# puts time.month   # => Month of the date (1 to 12)
# puts time.day     # => Day of the date (1 to 31 )
# puts time.wday    # => 0: Day of week: 0 is Sunday# for sunday!!!!
# puts time.yday    # => 365: Day of year##day of year!!!!!
# puts time.hour    # => 23: 24-hour clock
# puts time.min     # => 59
# puts time.sec     # => 59
# puts time.usec    # => 999999: microseconds
# puts time.zone    # => "UTC": timezone name
