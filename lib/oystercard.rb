class Oystercard

  attr_reader :balance, :max_balance, :min_balance
  attr_accessor :in_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 0
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE, in_journey = false)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    @in_journey = in_journey
  end

  def top_up(value)
    fail "this top_up would exceed maximum balance" if value+balance > @max_balance
    @balance += value
  end

  def deduct(value)
    fail "this journey would take your balance below £0" if balance-value < @min_balance
    @balance -= value
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end

