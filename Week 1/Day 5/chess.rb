require 'pry'

class Tokens

  def initialize(board,start,finish)
    @board = board
    @start = start
    @finish = finish
    @x_start = @start[0]
    @y_start = @start[1]

  end
end



class Pawn < Tokens

  def validator

    token = @board[@start]

    if token.include? 'b'
      b_validator(token)
    else
      w_validator(token)
    end

  end


  def w_validator(token)
    my_color = 'w'
    opp_color = 'b'


    if @start[1] == 2 #one or two movements
      if @board[@finish] == "--"
        if @finish == [@x_start,@y_start + 1]
          return  puts "LEGAL"
        elsif @finish == [@x_start,@y_start + 2] && @board[[@x_start,@y_start + 1]] == "--"
          return puts "LEGAL"
        else
          return puts "ILLEGAL"
        end
      elsif @board[@finish].include? 'b'
        if @finish == [@x_start - 1,@y_start + 1] || @finish == [@x_start + 1,@y_start + 1]
          return puts "LEGAL"
        else
          return puts "ILLEGAL"
        end
      else
        return puts "ILLEGAL"
      end
    else #one movement
      if @board[@finish] == '--' && @finish = [@x_start,@y_start+1]
        return puts "LEGAL"
      else
        return puts "ILLEGAL"
      end
    end

  end

  def b_validator(token)
    my_color = 'b'
    opp_color = 'w'



    if @start[1] == 7 #one or two movements
      if @board[@finish] == "--"
        if @finish == [@x_start,@y_start -1]
          return puts "LEGAL"
        elsif @finish == [@x_start,@y_start - 2] && @board[[@x_start,@y_start - 1]] == "--"
          return puts "LEGAL"
        else
          return puts "ILLEGAL"
        end
      elsif @board[@finish].include? 'w'
        if @finish == [@x_start - 1,@y_start - 1] || @finish == [@x_start + 1,@y_start - 1]
          return puts "LEGAL"
        else
          return puts "ILLEGAL"
        end
      else
        return puts "ILLEGAL"
      end
    else #one movements

      if @board[@finish] == '--' && @finish = [@x_start,@y_start-1]
        return puts "LEGAL"
      end
    end
  end


end


class Knight < Tokens

  def validator
    puts "knight"
  end

end

class Board

  def initialize(board,movements)
    @board = board
    @movements = movements
    @start = ""
    @finish =""
  end

  def loopMovements

    @movements.each do |x|
      @start = x[0]
      @finish = x[1]
      tokenSort(@board[@start])
    end

  end

  def tokenSort(token)

    if token.include? "P"
      Pawn.new(@board,@start,@finish).validator
    elsif token.include? "N"
      Knight.new(@board,@start,@finish).validator
    elsif token.include? "B"
      puts "bishop"
    elsif token.include? "R"
      puts "rook"
    elsif token.include? "Q"
      puts "queen"
    elsif token.include? "K"
      puts "king"
    else
      puts "ILLEGAL"
    end
  end
end


def getMovements_file(file)

  movements_array =[]
  array_moves = IO.read(file).split(' ')

  i=0
  begin
     movements_array.push([array_moves[i],array_moves[i+1]])
     i +=2;
  end until i >= array_moves.length
  return movements_array
end

def convert_movements_to_local_system(movements)
  local_movements=[]
  change = {"a" => 1,"b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8}

  movements.each do |x|
    local_movements.push([[change[x[0][0]],x[0][1].to_i],[change[x[1][0]],x[1][1].to_i]])
  end

return local_movements
end

def getBoard_file(file)
  hash_position={}
  board = IO.read(file).split(" ")

  i=0
  [8,7,6,5,4,3,2,1].each do |y|
    (1..8).each do |x|
      hash_position[[x,y]] = board[i]
      print "#{board[i]} "
      i += 1
    end
    puts "\n"
  end
  return hash_position
end

movements = getMovements_file("simple_moves.txt")
local_movements = convert_movements_to_local_system(movements)
board = getBoard_file("simple_board.txt")

board = Board.new(board,local_movements)
board.loopMovements
