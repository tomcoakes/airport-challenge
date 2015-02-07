require_relative 'weather'

class Plane

  include Weather

  attr_writer :flying
  attr_accessor :location

  def initialize(starting_airport)
    @flying = false
    @location = starting_airport
    starting_airport.gates << self
  end

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def land_at(airport)
    airport.allow_landing(self) # is this too much of a dependency?
    land
    @location = airport
  end

  def take_off
    location.allow_take_off(self) # is this too much of a dependency?
    self.flying = true
    @location = nil
  end

end
