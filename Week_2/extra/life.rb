require 'pry'

class Cell
  attr_reader :state
  def initialize(state, neighbours)
    @state = state
    @neighbours = neighbours
  end

  def regenerate
    return 1 if ((@neighbours.reduce(:+) == 2) || (@neighbours.reduce(:+) == 3)) && @state == 1
    return 1 if (@neighbours.reduce(:+) == 3) && @state == 0
    return 0
  end
end

class Grid
  attr_reader :grid
  def initialize(x)
    @x = x
    @grid = {}

    (0..(@x+1)).each do |x|
      (0..(@x+1)).each do |y|
        @grid["#{x}#{y}"] = 0
      end
    end

    @grid["33"] = 1
    @grid["34"] = 1
    @grid["32"] = 1
    @grid["43"] = 1
    @grid["44"] = 1
    @grid["45"] = 1
  end


  def print_grid(grid)
    (1..@x).each do |x|
      (1..@x).each do |y|
        status_cell = grid["#{x}#{y}"]
        print "#{status_cell} "
      end
      print "\n"
    end
  end

  def regenerate_grid
    regenerate_grid = {}
    (1..@x).each do |x|
      (1..@x).each do |y|
        neighbours = []
        neighbours.push(@grid["#{x+1}#{y-1}"])
        neighbours.push(@grid["#{x+1}#{y+1}"])
        neighbours.push(@grid["#{x+1}#{y}"])
        neighbours.push(@grid["#{x}#{y+1}"])
        neighbours.push(@grid["#{x}#{y-1}"])
        neighbours.push(@grid["#{x-1}#{y-1}"])
        neighbours.push(@grid["#{x-1}#{y+1}"])
        neighbours.push(@grid["#{x-1}#{y}"])

        cell = Cell.new(@grid["#{x}#{y}"],neighbours)
        regenerate_grid["#{x}#{y}"] = cell.regenerate

      end
    end
    print_grid(regenerate_grid)
  end
end



grid = Grid.new(7)
grid.print_grid(grid.grid)
puts "\n"
grid.regenerate_grid
