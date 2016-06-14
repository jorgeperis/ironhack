class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

$homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Jorge's place", "Vilafranca", 2, 25),
  Home.new("Laura's place", "Huesca", 1, 32),
  Home.new("Mónica's place", "Valencia", 2, 45),
  Home.new("Javi's place", "Mallorca", 3, 51),
  Home.new("Nera's place", "Murcia", 4, 36)
]

def print_home(array)
  array.each do |home|
    puts "Name: #{home.name} | City: #{home.city} | Capacity: #{home.capacity} | Price: #{home.price}"
  end
end

def sorting()
  puts "How to sort the homes, by price(p) or by capacity(c)?"
  ans = gets.chomp

  if ans == "p" || ans == "P"
    sort_price = $homes.sort_by {|home| -home.price}
    print_home(sort_price)
  elsif ans == "c" || ans == "C"
    sort_capa = $homes.sort_by {|home| home.capacity}
    print_home(sort_capa)
  else
    sorting()
  end
end

def filter_by_city()
  puts "Write the city to filter..."
  cit = gets.chomp
  selected_homes = $homes.select {|item| cit == item.city}

  if selected_homes[0] == nil
    filter_by_city()
  else
    print_home(selected_homes)
  end
end

def average_prices()
  total_prices = $homes.reduce(0.0) do |sum, money|
    sum + money.price
  end
  puts total_prices / $homes.length
end

def enter_price()
  puts "Enter the price..."
  pri = gets.chomp
  prin=[]
  prin[0] = $homes.find {|item| pri.to_i == item.price}

  if prin[0] == nil
    enter_price()
  else
    print_home(prin)
  end

end

def welcome()

  puts "\n\n(1) Print homes"
  puts "(2) Sort homes"
  puts "(3) Filter by city"
  puts "(4) Enter a price"
  puts "(5) Average of prices"
  puts "(6) Exit"
  inp = gets.chomp

  case inp
    when "1"
      print_home($homes)
      welcome()
    when "2"
      sorting()
      welcome()
    when "3"
      filter_by_city()
      welcome()
    when "4"
      enter_price()
      welcome()
    when "5"
      average_prices()
      welcome()
    when "6"
      exit
    else
      welcome()
  end
end

puts "Welcome to textbnb"
welcome()
