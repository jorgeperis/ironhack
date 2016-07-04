
class TextInspectionController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text]
    words = @text.split(" ")
    @word_count = words.length

    @time = ((60 * @word_count.to_f) / 275)

    hash_counter = {}
    words.each do |word|
      if hash_counter.key?(word)
        hash_counter[word] += 1
      else
        hash_counter[word] = 1
      end
    end
    @result = hash_counter.sort_by { |_word, count| count }.reverse
    render 'results'
  end
end
