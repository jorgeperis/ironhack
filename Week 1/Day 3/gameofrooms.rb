class Room

  def self.write_hash(hash)
  @@hash_rooms = hash
  end

  def initialize(north,east,south,west,description)
    @hash_room_move = {"N" => north,"E" => east,"S" => south,"W" => west}
    @description = description
  end

  def move(door_position)
    if door_position
      puts "Enter the door"
      @@hash_rooms[door_position].status
    else
      puts "No door"
    end
  end

  def status
    puts "#{@description}\n>"
    next_move = gets.chomp
    move(@hash_room_move[next_move.upcase])
  end

end


roomA = Room.new(false,"G","B",false,"You are in a dark room A with two doors")
roomB = Room.new("A","F",false,"C","You are in a dark room B with three doors")
roomC = Room.new(false,"B","D",false,"You are in a dark room C with two doors")
roomD = Room.new("C","E",false,false,"You are in a dark room D with two doors")
roomE = Room.new("F",false,false,"D","You are in a dark room E with two doors")
roomF = Room.new("G",false,"E","B","You are in a dark room F with three doors")
roomG = Room.new(false,false,"F","A","You are in a dark room G with two doors")


hash_rooms = {"A" => roomA,"B" => roomB,"C" => roomC,"D" => roomD,"E" => roomE,"F" => roomF,"G" => roomG}

Room.write_hash(hash_rooms)

roomA.status
