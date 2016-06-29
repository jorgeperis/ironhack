require 'rspec'
require './calculator'

describe 'Calculator' do
  describe '#add' do
    it 'returns 0 for no numbers' do
      result = Calculator.new.add('')
      expect(result).to eq(0)
    end

    it 'returns 6 for no numbers' do
      result = Calculator.new.add('1,2,3')
      expect(result).to eq(6)
    end

    it 'returns 6 for no numbers' do
      result = Calculator.new.add('3')
      expect(result).to eq(3)
    end
  end
end
