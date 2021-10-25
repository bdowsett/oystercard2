require 'oystercard'

describe Oystercard do
  it 'has a default balance' do
    expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE  # we want oystercard.balance to equal the set default balance
  end
end