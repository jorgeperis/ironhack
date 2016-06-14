class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

#map exercice
home = homes.map {|hom| hom.name}
puts home

#each exercice
homes.each do |house|
  puts "#{house.name} in #{house.city}"
  puts "Price: #{house.price} a night\n\n"
end

#map exercice
prices = homes.map {|home| home.price}
puts prices

#Reduce exercice
total_prices = homes.reduce(0.0) do |sum, money|
  sum + money.price
end
puts total_prices / homes.length
