require 'pry'

class Tokens
  def initialize(board,start,finish)
    @board = board
    @start = start
    @finish = finish
    @x_start = @start[0]
    @y_start = @start[1]
    @x_finish = @finish[0]
    @y_finish = @finish[1]
    @token = @board[@start]

    if @token.include? 'b'
      @opposite = 'w'
    else
      @opposite = 'b'
    end

  end

  def check_possibility(possibility)
    possibility.each do |position|

      if (@finish == position) && ((@board[position] == '--') || (@board[position].include? @opposite))
        return 'LEGAL'
      end
    end

    return 'ILLEGAL'
  end

end

class Pawn < Tokens

  def validator

    if @token.include? 'b'
      b_validator
    else
      w_validator
    end

  end


  def w_validator
    my_color = 'w'
    opp_color = 'b'

    if @start[1] == 2 #one or two movements
      if @board[@finish] == "--"
        if @finish == [@x_start,@y_start + 1]
          return  "LEGAL"
        elsif @finish == [@x_start,@y_start + 2] && @board[[@x_start,@y_start + 1]] == "--"
          return "LEGAL"
        else
          return "ILLEGAL"
        end
      elsif @board[@finish].include? 'b'
        if @finish == [@x_start - 1,@y_start + 1] || @finish == [@x_start + 1,@y_start + 1]
          return "LEGAL"
        else
          return "ILLEGAL"
        end
      else
        return "ILLEGAL"
      end
    else #one movement
      if @board[@finish] == '--' && @finish = [@x_start,@y_start + 1]
        return "LEGAL"
      else
        return "ILLEGAL"
      end
    end
  end

  def b_validator
    my_color = 'b'
    opp_color = 'w'

    if @start[1] == 7 #one or two movements
      if @board[@finish] == "--"
        if @finish == [@x_start,@y_start -1]
          return "LEGAL"
        elsif @finish == [@x_start,@y_start - 2] && @board[[@x_start,@y_start - 1]] == "--"
          return "LEGAL"
        else
          return "ILLEGAL"
        end
      elsif @board[@finish].include? 'w'
        if @finish == [@x_start - 1,@y_start - 1] || @finish == [@x_start + 1,@y_start - 1]
          return "LEGAL"
        else
          return "ILLEGAL"
        end
      else
        return "ILLEGAL"
      end
    else #one movements
      if @board[@finish] == '--' && @finish = [@x_start,@y_start - 1]
        return "LEGAL"
      else
        return "ILLEGAL"
      end
    end
  end
end

class Rook < Tokens
  def validator
    if @y_start == @y_finish #horizontal movements
      if @x_finish > @x_start #right
        ((@x_start + 1)..@x_finish).each do |x_move|
            if (x_move == @x_finish) && ((@board[[x_move,@y_start]] == '--') || (@board[[x_move,@y_start]].include? @opposite))
              return 'LEGAL'
            end
            if @board[[x_move,@y_start]] != '--'
              return 'ILLEGAL'
            end
        end
      else
        if @x_finish < @x_start #left
          ((10-(@x_start - 1))..(10 - @x_finish)).each do |x_move|
              if ((10 - x_move) == @x_finish) && ((@board[[(10 - x_move),@y_start]] == '--') || (@board[[(10 - x_move),@y_start]].include? @opposite))
                return 'LEGAL'
              end
              if @board[[(10 - x_move),@y_start]] != '--'
                return 'ILLEGAL'
              end
          end
        end
      end

    elsif @x_start == @x_finish #vertical movements

      if @y_finish > @y_start #top
        ((@y_start + 1)..@y_finish).each do |y_move|
            if (y_move == @y_finish) && ((@board[[@x_start,y_move]] == '--') || (@board[[@x_start,y_move,]].include? @opposite))
              return 'LEGAL'
            end
            if @board[[@x_start,y_move]] != '--'
              return 'ILLEGAL'
            end
        end
      else
        if @y_finish < @y_start #down
          ((10-(@y_start - 1))..(10 - @y_finish)).each do |y_move|
              if ((10 - y_move) == @y_finish) && ((@board[[@x_start,(10 - y_move)]] == '--') || (@board[[@x_start,(10 - y_move)]].include? @opposite))
                return 'LEGAL'
              end
              if @board[[@x_start,(10 - y_move)]] != '--'
                return 'ILLEGAL'
              end
          end
        end
      end
    else
      return "ILLEGAL"
    end

  end
end

class Bishop < Tokens
  def validator


    if ((@y_finish - @y_start) == (@x_finish - @x_start) || (@y_finish - @y_start) == (@x_start - @x_finish))
      if (@x_finish > @x_start) && (@y_finish > @y_start)
        try = @start
        while (try[0] < 8) && (try[1] < 8) do
          try = [try[0] + 1,try[1] + 1]
          if (try == @finish) && ((@board[try] == '--') || (@board[try].include? @opposite))
            return 'LEGAL'
          end
          if @board[try] != '--'
            return 'ILLEGAL'
          end
        end

      elsif (@x_finish < @x_start) && (@y_finish > @y_start)
        try = @start
        while (try[0] > 1) && (try[1] < 8) do
          try = [try[0] - 1,try[1] + 1]
          if (try == @finish) && ((@board[try] == '--') || (@board[try].include? @opposite))
            return 'LEGAL'
          end
          if @board[try] != '--'
            return 'ILLEGAL'
          end
        end
      elsif (@x_finish > @x_start) && (@y_finish < @y_start)

        try = @start
        while (try[0] < 8) && (try[1] > 1) do
          try = [try[0] + 1,try[1] - 1]
          if (try == @finish) && ((@board[try] == '--') || (@board[try].include? @opposite))
            return 'LEGAL'
          end
          if @board[try] != '--'
            return 'ILLEGAL'
          end
        end
      elsif (@x_finish < @x_start) && (@y_finish < @y_start)
        try = @start
        while (try[0] > 1) && (try[1] > 1) do
          try = [try[0] - 1,try[1] - 1]
          if (try == @finish) && ((@board[try] == '--') || (@board[try].include? @opposite))
            return 'LEGAL'
          end
          if @board[try] != '--'
            return 'ILLEGAL'
          end
        end
      else
        return 'ILLEGAL'
      end
    else
      return 'ILLEGAL'
    end
  end
end

class King < Tokens

  def validator

    possibility=[]
    possibility[0] = [@x_start - 1,@y_start + 1]
    possibility[1] = [@x_start,@y_start + 1]
    possibility[2] = [@x_start + 1,@y_start + 1]
    possibility[3] = [@x_start + 1,@y_start]
    possibility[4] = [@x_start + 1,@y_start - 1]
    possibility[5] = [@x_start,@y_start - 1]
    possibility[6] = [@x_start - 1,@y_start - 1]
    possibility[7] = [@x_start - 1,@y_start]

    check_possibility(possibility)

  end

end

class Queen < Tokens
  def validator

    bishop = Bishop.new(@board,@start,@finish).validator
    rook = Rook.new(@board,@start,@finish).validator

    if (bishop == 'ILLEGAL') && (rook == 'ILLEGAL')
      return 'ILLEGAL'
    else
      return 'LEGAL'
    end
  end
end

class Knight < Tokens

  def validator

    possibility=[]
    possibility[0] = [@x_start - 1,@y_start + 2]
    possibility[1] = [@x_start + 1,@y_start + 2]
    possibility[2] = [@x_start - 1,@y_start - 2]
    possibility[3] = [@x_start + 1,@y_start - 2]
    possibility[4] = [@x_start - 2,@y_start + 1]
    possibility[5] = [@x_start + 2,@y_start + 1]
    possibility[6] = [@x_start - 2,@y_start - 1]
    possibility[7] = [@x_start + 2,@y_start - 1]


    check_possibility(possibility)

  end
end

class Board

  def initialize(board,movements)
    @board = board
    @movements = movements
    @start = ""
    @finish =""
    @result = []
  end

  def show_result
    puts @result
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
      @result.push(Pawn.new(@board,@start,@finish).validator)
    elsif token.include? "N"
      @result.push(Knight.new(@board,@start,@finish).validator)
    elsif token.include? "B"
      @result.push(Bishop.new(@board,@start,@finish).validator)
    elsif token.include? "R"
      @result.push(Rook.new(@board,@start,@finish).validator)
    elsif token.include? "Q"
      @result.push(Queen.new(@board,@start,@finish).validator)
    elsif token.include? "K"
      @result.push(King.new(@board,@start,@finish).validator)
    else
      @result.push("ILLEGAL")
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

movements = getMovements_file("complex_moves.txt")
local_movements = convert_movements_to_local_system(movements)
board = getBoard_file("complex_board.txt")
board = Board.new(board,local_movements)

board.loopMovements
board.show_result
