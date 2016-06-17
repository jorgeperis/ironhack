require 'pry'

class Tokens

  def initialize(movements,board)
    @movements = movements
    @board = board
  end

  def tokenSort(token)

    if token.include? "P"
      puts "pawn"
    elsif token.include? "N"
      puts "knight"
    elsif token.include? "B"
      puts "bishop"
    elsif token.include? "R"
      puts "rook"
    elsif token.include? "Q"
      puts "queen"
    elsif token.include? "K"
      puts "king"
    end

  end

  def loopMovements
    @movements.each do |x|
      tokenSort(@board[x[0].to_sym])
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

def getBoard_file(file)
  hash_position={}
  board = IO.read(file).split(" ")

  i=0
  [8,7,6,5,4,3,2,1].each do |y|
    ('a'..'h').each do |x|
      hash_position["#{x}#{y}".to_sym] = board[i]
      #print "#{board[i]} "
      i += 1
    end
    #puts "\n"
  end
  return hash_position
end

movements = getMovements_file("simple_moves.txt")
board = getBoard_file("simple_board.txt")

tokens = Tokens.new(movements,board)
tokens.loopMovements
