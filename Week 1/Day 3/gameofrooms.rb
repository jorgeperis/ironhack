require 'pry'


class Room
  attr_reader :hash_room_move, :object, :bad
  attr_writer :object, :bad
  def initialize(north,east,south,west,place,clue,object,bad,noentry)
    @hash_room_move = {"N" => north,"E" => east,"S" => south,"W" => west}
    @object = object
    @bad = bad
    @place = place
    @clue = clue
    @noentry = noentry
  end

  def noentry
    puts @noentry
  end

  def description
    print "You are in #{@place}. "

    if @clue != ""
      print "There is #{@clue}. "
    end

    if @bad != ""
      print "There is a #{@bad}."
    end

    if @object != ""
      print "You can see a #{@object}."
    end
    puts "\n>"
  end

end


class Game
attr_accessor :obj_to_kill,:obj_for_fun
  def initialize(hash_rooms,actions,obj_to_kill,obj_for_fun)
    @hash_rooms = hash_rooms
    @actions = actions
    @inventary=[]
    @obj_to_kill=obj_to_kill
    @obj_for_fun=obj_for_fun
  end

  def start(room,player)
    @player = player
    room.description
    next_move = gets.chomp.upcase
    what_to_do(next_move,room,@player)
  end

  def continue(room)
    room.description
    next_move = gets.chomp.upcase
    what_to_do(next_move,room,@player)
  end

  def what_to_do(input,room,player)

    @actions.each do |x|

      if input == x
        room.action(input)
      end
    end

    if input.index("PICK") != nil
      if input.index(room.object.upcase) != nil
        player.add_object(room.object,room)
        continue(room)
      end
    elsif input.index("USE") != nil
      player.use_object(input,room)
    elsif input.index("DROP") != nil
      player.drop_object(input,room)
    end

    case input
    when "N","E","S","W"
      move_door(room.hash_room_move[input],room,@player)
    when "INVENTARY"
      player.show_inventary
      continue(room)
    end
  end

  def move_door(door_position,room,player)
    if door_position
      continue(@hash_rooms[door_position])
    else
      room.noentry
      continue(room)
    end
  end



end

class Player

  def initialize(game)
    @game = game
    @inventary = []
  end

  def show_inventary
    puts "Inventary:\n#{@inventary}"
  end

  def add_object(obj,room)
    @inventary.push(obj)
    room.object = ""
  end

  def drop_object(obj,room)
    @inventary.each do |x|
      if obj.index(x.upcase) != nil
        room.object = x
        @inventary.delete(x)
        @game.continue(room)
      else
        puts "No object to drop"
        @game.continue(room)
      end
    end
  end

  def use_object(obj,room)

    obje = obj.split(" ").last

    if @game.obj_to_kill.key?(obje)
      puts "Nothing to do with the object"
      @game.continue(room)
    else

      @game.obj_to_kill[obje.downcase].each do |x|
        if x == room.bad
          puts "You kill #{room.bad}!!"
          room.bad = ""
          @game.continue(room)
        end
      end
      puts "Nothing to do with the object"
      @game.continue(room)
      end
    end

end

roomA = Room.new(false,"G","B",false,"a desert","a lot of light","water","","You can't pass, sand dune!")
roomB = Room.new("A","F",false,"C","home","three doors","pendrive","","There is no door in this direction!")
roomC = Room.new(false,"B","D",false,"Ironhack campus","a lot of people","computer","Darth vader","Not allowed, a lot of bugs!")
roomD = Room.new("C","E",false,false,"the mountain","two doors","","dragon","You can't pass, a Cliff!")
roomE = Room.new("F",false,false,"D","the beach","a lot of light","lifeguard","","Not allowed,
rough sea!")
roomF = Room.new("G",false,"E","B","a river","","","crocodile","are you crazy? There is a crocodile!")
roomG = Room.new(false,false,"F","A","the forest","two doors","knife","scorpion","Danger, no this way, ugly bugs!")

hash_rooms = {"A" => roomA,"B" => roomB,"C" => roomC,"D" => roomD,"E" => roomE,"F" => roomF,"G" => roomG}
actions = ["RUN","KILL","EAT","CRY"]
obj_to_kill = {"knife" => ["crocodile","scorpion","dragon"],"lifeguard" => ["scorpion","dragon"],"water" => ["dragon"],}
obj_for_fun = {"pendrive" => ["computer"],}


game = Game.new(hash_rooms,actions,obj_to_kill,obj_for_fun)
player = Player.new(game)


game.start(roomA,player)
