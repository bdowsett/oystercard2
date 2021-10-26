class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :entry_station
  attr_accessor :in_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE, entry_station = nil)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    @entry_station = entry_station
  end

  def top_up(value)
    fail "this top_up would exceed maximum balance" if value+balance > @max_balance
    @balance += value
  end

  def touch_in(station)
    fail 'Error: insufficient funds' if @balance < @min_balance
    @entry_station = station
    "your current balance is £#{@balance}"
  end

  def touch_out
    deduct(@min_balance)
    @entry_station = nil
    "your current balance is £#{@balance}"
  end
end

private

def deduct(value)
  fail "this journey would take your balance below the minimum balance" if balance-value < @min_balance
  @balance -= value
end