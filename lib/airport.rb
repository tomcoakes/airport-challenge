require_relative 'weather'

class Airport

  include Weather

  def initialize
    @capacity = 20
  end

  def gates
    @gates ||= []
  end

  def allow_landing(plane)
    raise "You can't land right now, there's a storm" if there_is_a_storm?
    raise "The airport is full, you can't land yet" if gates_in_use == @capacity
    gates << plane
  end

  def allow_take_off(plane)
    raise "You can't take off right now, there's a storm" if there_is_a_storm?
    gates.delete(plane)
  end

  def gates_in_use
    gates.count
  end


# I've isolated this method so that Airport has control over it
# I think that's what it teaches in POODR
  def there_is_a_storm?
    self.is_stormy?
  end

end