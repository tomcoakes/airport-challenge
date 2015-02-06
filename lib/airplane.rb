require 'weather'

class Airplane

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

  def not_flying
    @flying = false
  end

  def land_at(airport)
    airport.allow_landing(self)
    not_flying
    @location = airport
  end

  def take_off
    location.allow_take_off(self)
    self.flying = true
    @location = nil
  end

end
