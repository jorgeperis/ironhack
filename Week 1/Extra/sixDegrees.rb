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
  return conection
end



class Users

  def initialize(conversation,user)
    @conversation = conversation
    @user = user
    @interconected = {}
    @deep = ['first','second','third','fourth','fifth','sixth']

    @deep.each do |x|
      @interconected[x] = []
    end

  end

  def bilateralConversation(deep,user)
    @conversation[user].each do |mention|
      binding.pry
      @conversation[mention].each do |mentionedByMention|
        if mentionedByMention == user
          result =[]
          @deep.each do |deep|
            if @interconected[deep] != nil
              result.push(@interconected[deep].include? mention)
            end
          end
          unless (@user == mention) || (result.include? true)
            @interconected[deep].push(mention)
          end
        end
      end
    end
  end

  def start
    bilateralConversation(@deep[0],@user)
    @deep.each_with_index do |deep,index|
      if deep == 'first'
        next
      end
      @interconected[@deep[index-1]].each_with_index do |interconected,i|
        bilateralConversation(deep,@interconected[@deep[index-1]][i])
      end
    end
    show_results
  end

  def show_results
    puts @user
    @interconected.each do |key,value|
      if value != []
      puts value.join(', ')
      end
    end
    puts "\n"
  end

end

puts "\n"
conversation = getConversations('Complex.txt')
conversation.each do |key,value|
  Users.new(conversation,key).start
end
