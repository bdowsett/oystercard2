require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'has a default balance' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE  # we want oystercard.balance to equal the set default balance
    end
  end

  describe '#top_up' do
    it 'add money to the oystercard' do
      expect(subject.top_up(5)).to eq 5
    end
  end
end