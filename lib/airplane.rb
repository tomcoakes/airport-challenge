class Airplane

  attr_writer :flying
  attr_accessor :location

  def initialize(starting_airport)
    @flying = false
    @location = starting_airport
  end

  def flying?
    @flying
  end

  def stop_flying
    @flying = false
  end

  def land_at(airport)
    airport.allow_landing(self)
    stop_flying
    @location = airport
  end

  def take_off
    location.allow_take_off(self)
    self.flying = true
    location = nil
  end

end
