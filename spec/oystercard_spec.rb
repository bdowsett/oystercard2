require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject.balance).to respond_to(balance)  # we want oystercard.balance responds to a balance method
  end
end