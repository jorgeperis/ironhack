class Calculator
  attr_reader :sym
  def initialize(num1,num2)
    @num1 = num1
    @num2 = num2
    @sym = ""
    end

  def add
    @sym = '+'
    @num1 + @num2
  end

  def substract
    @sym = '-'
    @num1 - @num2
  end

  def multiply
    @sym = '*'
    @num1 * @num2
  end

  def divide
    @sym = '/'
    @num1 / @num2
  end
end
