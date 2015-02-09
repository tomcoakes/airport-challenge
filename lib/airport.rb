require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 6

  attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
  end

  def gates
    @gates ||= []
  end

  def allow_landing(plane)
    raise "You can't land right now, there's a storm" if there_is_a_storm?
    raise "The airport is full, you can't land yet" if full?
    gates << plane
  end

  def allow_take_off(plane)
    raise "You can't take off right now, there's a storm" if there_is_a_storm?
    gates.delete(plane)
  end

  def gates_in_use
    gates.count
  end

  def full?
    gates_in_use == capacity
  end


# I've isolated this module method so that Airport has control over it
# I think that's what it teaches in POODR
  def there_is_a_storm?
    self.is_stormy?
  end

end