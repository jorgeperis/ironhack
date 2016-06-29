class Login
attr_reader :user
  def initialize(user,pass,credentials)
    @user = user
    @pass = pass
    @credentials = credentials
  end


  def check_pass

    if @credentials[:password] == @pass && @credentials[:user] == @user
      return true
    else
      puts "Invalid username or password"
    end

  end

end


class Menu
  def initialize(user,option)
    @user = user
    @option = option
    @text = ""
  end

  def enter_text
    puts "Hi, #{@user}, enter the text"
    @text = gets.chomp
    show_menu
  end

  def show_menu
    puts "Choose an option..."
    puts "(1) #{@option['1'].description}"
    puts "(2) #{@option['2'].description}"
    puts "(3) #{@option['3'].description}"
    puts "(4) #{@option['4'].description}"
    puts "(5) #{@option['5'].description}"
    puts "(6) Exit"
    choose_option
  end

  def choose_option
    input_option = gets.chomp

    if input_option == '6'
      exit
    else
      if @option[input_option] != nil
        @option[input_option].work(@text)
        show_menu
      else
        puts "Write a number to select the option"
        show_menu
      end
    end
  end
end

class Methods
  attr_reader :description
  def initialize(description)
    @description =description
  end
end

class CountWords < Methods

  def work(input_text)
    number_words = input_text.split(" ").size
    puts "There are #{number_words} words in your text"
  end

end

class CountLetters < Methods

  def work(input_text)
    puts "There are #{input_text.size} letters in your text"
  end
end

class Reverse < Methods

  def work(input_text)
    puts "This is the text reversed:"
    puts input_text.reverse
  end
end

class Upcase < Methods
  def work(input_text)
    puts "This is the text with upcase:"
    puts input_text.upcase
  end
end

class Downcase < Methods
  def work(input_text)
    puts "This is the text with downcase:"
    puts input_text.downcase
  end
end



puts "User:"
user = gets.chomp
puts "Password:"
pass = gets.chomp

credentials = {:user => "Jorge",:password => "123456"}
login = Login.new(user,pass,credentials)

countw = CountWords.new("Count words")
countl = CountLetters.new("Count letters")
rever = Reverse.new("Reverse the text")
upca = Upcase.new("Upcase the text")
down = Downcase.new("Downcase the text")

hash = {'1' => countw,'2' => countl,'3' => rever,'4' => upca,'5' => down}

if login.check_pass
  Menu.new(user,hash).enter_text
end
