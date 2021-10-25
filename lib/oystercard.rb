class Oystercard

  attr_reader :balance, :max_balance
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
  end

  def top_up(value)
    @balance += value
    fail "this top_up would exceed maximum balance" if @balance > @max_balance
    @balance
  end

  def deduct(value)
    
  end
end

