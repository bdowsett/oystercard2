require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    # oystercard = Oystercard.new
    expect(subject.balance).to eq true  # we want oystercard.balance responds to a balance method
  end
end