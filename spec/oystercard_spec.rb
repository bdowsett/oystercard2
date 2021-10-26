require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'has a default balance' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE  # we want oystercard.balance to equal the set default balance
    end
    it "defaults to not in journey" do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'add money to the oystercard' do
      expect(subject.top_up(Oystercard::MAX_BALANCE)).to eq subject.balance
    end

    it 'raises error if balance exceeds maximum balance' do
      expect { raise StandardError, "this top_up would exceed maximum balance"}.to raise_error "this top_up would exceed maximum balance"
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts money from the oystercard' do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect(subject.deduct(4)).to eq subject.balance
    end

    it 'raises an error if balance is less than the minimum balance' do #testing edge case of 'minimum balance'
      expect { raise StandardError, "this journey would take your balance below the minimum balance"}.to raise_error "this journey would take your balance below the minimum balance"
    end
  end
  describe '#touch_in' do
      it 'touches card in' do
        subject.top_up(Oystercard::MAX_BALANCE)
        subject.touch_in
        expect(subject.in_journey).to eq true
      end

      it 'raises an error when balance is below minimum balance' do
        expect { subject.touch_in }.to raise_error 'Error: insufficient funds'
      end
  end

  describe '#touch_out' do
      it 'touches card out' do
        subject.top_up(Oystercard::MAX_BALANCE)
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey).to eq false
      end 
  end
end