require 'pry'

def getConversations(file)
  input_file = []
  input_file = IO.readlines(file)
  conection ={}
  input_file.each do |line|

    firstName = line.split(':').first

    case line.count('@')
      when 0
        conection[firstName] = nil
      when 1
        if conection[firstName] == nil
          conection[firstName] = Array.new([(line.match /@\w*/).to_s.tr('@','')])
        else
          conection[firstName].push((line.match /@\w*/).to_s.tr('@',''))
        end

      else
        names=[]
        while line.include? '@'
          names.push((line.match /@\w*/).to_s.tr('@',''))
          line.sub!('@','a')
        end
        if conection[firstName] == nil
          conection[firstName] = names
        else
          names.each do |name|
            conection[firstName].push(name)
          end
        end
      end
  end
  # conection.each do |key,value|
  #   puts "#{key} -> #{value}"
  # end
  return conection
end



class Users

  def initialize(conversation,user)
  @conversation = conversation#hash with usr as a key and an array of mentioned users
  @user = user
  @interconected = {}
  @interconected[@user] = []
  end

  def bilateralConversation
    @conversation[@user].each do |mention|
      @conversation[mention].each do |mentionedByMention|
        if mentionedByMention == @user
            @interconected[@user].push(mention)
        end
      end
    end
    puts @interconected
  end


end

conversation = getConversations('Simple.txt')
conversation.each do |key,value|
  Users.new(conversation,key).bilateralConversation
end


# def orderFriends(conection)
#   twoWaysConection = []
#   conection.each do |startName,mentionArray|
#     mentionArray.each do |mention|
#       if conection[mention] != nil
#         conection[mention].each do |name|
#           if name == startName
#             twoWaysConection.push([startName,mention])
#           end
#         end
#       end
#     end
#   end
#   # twoWaysConection.each do |x|
#   #   puts "#{x[0]} <--> #{x[1]}"
#   # end
#   return twoWaysConection
# end
#
# def firstFriends(conection)
#   con = {}
#   conection.each do |firstconection|
#     conection.each do |conections|
#       if firstconection[1] == conections[0]
#         if con[firstconection[0]] == nil
#           con[firstconection[0]] = Array.new([conections[0]])
#         else
#           unless con[firstconection[0]].include? conections[0]
#             con[firstconection[0]].push(conections[0])
#           end
#         end
#       end
#     end
#   end
#   # puts con
# end

# interconected(getConversations('Simple.txt'))






















#hola
