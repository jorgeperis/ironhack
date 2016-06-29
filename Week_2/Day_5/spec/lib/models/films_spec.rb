require "./lib/models/films.rb"
require 'rspec'

describe Movies do


  it "#content returns a list of posts with size 9" do
    expect(Movies.getmovies('Star wars').length).to eq(9)
  end

  it "#content returns a list of posts with poster" do
    expect(Movies.getmovies('Star wars').detect {|film| film.poster == nil}).to eq(nil)
  end

end
