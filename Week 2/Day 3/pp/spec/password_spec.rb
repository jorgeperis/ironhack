require 'rspec'
require '../lib/password.rb'

describe PasswordChecker do
  subject { described_class.new('jorge@pepe.com','ab´cdE4fgt') }

  describe '#seven' do
    let(:expected_output) { true }
    let(:result) { subject.seven }

    it "string is longer than 7" do
      expect(result).to eq(expected_output)
    end
  end

  describe '#symbols' do
    let(:expected_output) { true }
    let(:result) { subject.symbols }

    it "at least 1 letter,1 number & 1 symbol" do
      expect(result).to eq(expected_output)
    end
  end

  describe '#email' do
    let(:expected_output) { true }
    let(:result) { subject.email }

    it "no name or domain in password" do
      expect(result).to eq(expected_output)
    end
  end
end
