class Airport

  def initialize
    @capacity = 20
  end

  def gates
    @gates ||= []
  end

  def allow_landing(plane)
    raise "The airport is full, you can't land yet" if gates_in_use == @capacity
      gates << plane
  end

  def allow_take_off(plane)
    gates.delete(plane)
  end

  def gates_in_use
    gates.count
  end

end