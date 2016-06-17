require 'pry'
class Board

  def initialize(position)
  @position = position
  end

  def print_board

    [8,7,6,5,4,3,2,1].each do |x|
      @position.each do |key,value|
        if (key.to_s).index(x.to_s) != nil
          if value == nil
            print "-- "
          else
            print "#{value} "
          end
        end
      end
      puts "\n"
    end
  end
end


class Tokens

  def initialize(movements)
    @input_movements = movements
    @tokens_position={}
  end

  def choose_token
    @input_movements.each do |position|
      pos_sym = position.split('').to_sym
      if @board[pos_sym] != nil
        @tokens_position[pos_sym] = @board[pos_sym]
      end
    end
  end
end

class Rock < Tokens
attr_reader :moves
  def initialize(board,start_finish)
    @board = board
    @origin = start_finish[0]
    @finish = start_finish[1]
    @moves =[]
    @valid_moves = {}
  end

  def validation
    opposite = ""

    if @board[@origin.to_sym] == "wR"
      opposite = "b"
    else
      opposite = "w"
    end

    x0 = @origin[0]
    y0 = @origin[1].to_i
    x1 = @finish[0]
    y1 = @finish[1].to_i

    if @board[@finish.to_sym].index(opposite) != nil || @board[@finish.to_sym] == nil

      if x0 == x1
        ((y0+1)...y1).each do |y|
          if @board["#{x0}#{y}".to_sym] != nil
            return @moves.push("ILLEGAL")
          end
        end

        return @moves.push("LEGAL")

      elsif y0 == y1
        (x0...x1).each_with_index do |x,i|

          if i == 0
            next
          end

          if @board["#{x}#{y0}".to_sym] != nil
            return @moves.push("ILLEGAL")
          end
        end

        return @moves.push("LEGAL")

      else
        return @moves.push("ILLEGAL")
      end

    elsif @board[@finish.to_sym].index(x0) != nil
      return @moves.push("ILLEGAL")
    end
  end

end









hash_position={}
('a'..'h').each do |x|
  (1..8).each do |y|
    hash_position["#{x}#{y}".to_sym] = nil
  end
end


def getMovements_file(file)

  get_moves = IO.read(file)
  array_moves = get_moves.split(' ')
  movements_array =[]

  i=0
  begin
     movements_array.push([array_moves[i],array_moves[i+1]])
     i +=2;
  end until i >= array_moves.length
  return movements_array
end


hash_position[:a2] = "wR"
hash_position[:a7] = "bR"
hash_position[:d2] = "wK"

tokens = Tokens.new(getMovements_file("simple_moves.txt"))
board = Board.new(hash_position)
board.print_board
wRock = Rock.new(hash_position,["a2","a7"])


wRock.validation
puts wRock.moves
