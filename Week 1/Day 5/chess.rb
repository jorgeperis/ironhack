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


  def validation

    @moves.each do |position|
      pos_sym = position.join('').to_sym

      if @board[pos_sym] == nil || @board[pos_sym].index('b') != nil
        @valid_moves[pos_sym] = 'LEGAL'
      else
        @valid_moves[pos_sym] = 'ILLEGAL'
      end

    end
  end
end

class Rock < Tokens
attr_reader :valid_moves
  def initialize(board)
    @board = board
    @origin = @board.key("wR").to_s.split('') #an array with x and y #change to get from outside
    @moves =[]
    @valid_moves = {}
  end

  def movement

    (1..8).each do |y|

      add_coor = [@origin[0],y.to_s]
      @moves.push(add_coor)

    end

    ("a".."h").each do |x|

      add_coor = [x,@origin[1]]
      @moves.push(add_coor)

    end
    @moves.delete(@origin)
  end


end









hash_position={}
('a'..'h').each do |x|
  (1..8).each do |y|
    hash_position["#{x}#{y}".to_sym] = nil
  end
end




hash_position[:a2] = "wR"
hash_position[:a7] = "bR"
hash_position[:d2] = "wK"

tokens = Tokens.new
board = Board.new(hash_position)
board.print_board
wRock = Rock.new(hash_position)

wRock.movement #first
wRock.validation #second
puts wRock.valid_moves #we have de legal and ilegal moves
