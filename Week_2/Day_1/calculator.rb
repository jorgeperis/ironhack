require 'pry'

class Calculator

  def add(number)
    sum = 0

    if number.include? ','
      arraynum = number.split(',')
    elsif number.size == 1
      return number.to_i
    else
      return 0
    end

    arraynum.each do |num|
      sum += num.to_i
    end
    return sum
  end
end


Calculator.new.add('1,2,3')
