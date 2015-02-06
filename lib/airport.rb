require 'weather'

class Airport

  include Weather

  def initialize
    @capacity = 20
  end

  def gates
    @gates ||= []
  end

  def allow_landing(plane)
    raise "Can't land right now, there's a storm" if there_is_a_storm?
    raise "The airport is full, you can't land yet" if gates_in_use == @capacity
    gates << plane
  end

  def allow_take_off(plane)
      gates.delete(plane)
  end

  def gates_in_use
    gates.count
  end

  def there_is_a_storm?
    self.is_stormy?
  end

end



  # def weather
  #   if rand(30) > 19 ? @weather = 'sunny' : @weather = 'stormy'
  # end