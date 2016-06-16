 require 'ruby-dictionary'
 require 'pry'

class WordChain

    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(var1,var2)

      var1_array = var1.split('')
      var2_array = var2.split('')
      hash = {var2_array[0] => var1_array[0],var2_array[1] => var1_array[1],var2_array[2] => var1_array[2]}


      var2_array.each_with_index do |x,i|
        if var1_array[i] == x
          next
        end
          var1_array[i] = x
          if @dictionary.exists?(var1_array.join(''))
            puts var1_array.join('')
            return find_chain(var1_array.join(''),var2)
          end
          var1_array[i] = hash[var2_array[i]]

      end

    end



end


dictionary = Dictionary.from_file('/usr/share/dict/words')


 my_chain = WordChain.new(dictionary)

 my_chain.find_chain("ruby", "code")
