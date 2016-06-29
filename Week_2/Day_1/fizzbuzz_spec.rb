require 'rspec'
require './fizzbuzz'

describe 'Fizzbuzz' do
  describe '#show' do
    it 'returns FIZZ for 3' do
      result = FizzBuzz.new.show(3)
      expect(result).to eq('FIZZ')
    end

    it 'returns BUZZ for 5' do
      result = FizzBuzz.new.show(5)
      expect(result).to eq('BUZZ')
    end

    it 'returns FIZZBUZZ for 15' do
      result = FizzBuzz.new.show(15)
      expect(result).to eq('FIZZBUZZ')
    end

    it 'returns 7 for 7' do
      result = FizzBuzz.new.show(7)
      expect(result).to eq(7)
    end
  end
end
