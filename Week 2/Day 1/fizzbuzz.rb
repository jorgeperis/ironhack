
class FizzBuzz

  def show(number)
    result = ''
    result += 'FIZZ' if number % 3 == 0
    result += 'BUZZ' if number % 5 == 0
    result = number if result == ''
    return result
  end

end
