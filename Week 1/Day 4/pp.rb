 require 'ruby-dictionary'
 require 'pry'

class WordChain

    def initialize(dictionary)
        @dictionary = dictionary
        @value = true
    end

    def find_chain(var1,var2)

      @value ? (puts var1) : (@value = false)

      hash = {var2[0] => var1[0],var2[1] => var1[1],var2[2] => var1[2]}


      var2.split('').each_with_index do |x,i|

        next if var1[i] == x

          var1[i] = x

          if @dictionary.exists?(var1)
            puts var1
            @value = false
            return find_chain(var1,var2)
          end

          var1[i] = hash[var2[i]]
        end

    end



end


dictionary = Dictionary.from_file('/usr/share/dict/words')


 my_chain = WordChain.new(dictionary)

 my_chain.find_chain("cat", "dog")
