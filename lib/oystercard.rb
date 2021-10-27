class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :entry_station, :journeys
  attr_accessor :in_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE, entry_station = nil)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    
    @in_journey = false
    @journeys = {}
  end

  def top_up(value)
    fail "this top_up would exceed maximum balance" if value+balance > @max_balance
    @balance += value
  end

  def touch_in(station)
    fail 'Error: insufficient funds' if @balance < @min_balance
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(@min_balance)
    @exit_station = station
    # @journeys << {@entry_station => @exit_station}
    @journeys[@entry_station] = @exit_station
    @entry_station = nil
    @in_journey = false
    
    
  end
end

private

def deduct(value)
  fail "this journey would take your balance below the minimum balance" if balance-value < @min_balance
  @balance -= value
end