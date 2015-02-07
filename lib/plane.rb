class Plane

  attr_writer :flying
  attr_accessor :location

  def initialize(starting_airport)
    @flying = false
    @location = starting_airport
    raise "There's no room at this airport, please transport the plane somewhere else" if starting_airport.full?
    starting_airport.gates << self
  end

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def land_at(airport)
    request_landing(airport)
    land
    @location = airport
  end

  def take_off
    request_take_off
    self.flying = true
    @location = nil
  end

  def request_landing(airport)
    airport.allow_landing(self) # is this too much of a dependency?
  end

  def request_take_off
    location.allow_take_off(self) # is this too much of a dependency?
  end

end
