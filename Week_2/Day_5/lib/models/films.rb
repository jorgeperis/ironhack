require 'imdb'
require 'pry'



class Movies

  def self.getmovies(word)
    @selected_movies = []

    imdb = Imdb::Search.new(word)

      imdb.movies.each do |movie|

        @selected_movies.push(movie) if movie.poster != nil

        return @selected_movies if @selected_movies.length == 9

      end

  end


end

def chooseQuestions(movies_array)
  movie = movies_array[rand(9)]
  questions = ["Which movie was released in #{movie.year}?","Which movie was directed by #{movie.director}?","Which movie has a duration of #{movie.length} min.?"]
  question = [movie.id,questions[rand(3)]]
end
