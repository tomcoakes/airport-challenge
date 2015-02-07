class Plane

  attr_writer :flying
  attr_accessor :location

  def initialize(starting_airport)
    @flying = false
    @location = starting_airport
    check_whether_airport_is_full(starting_airport)
    put_new_plane_in_gate(starting_airport)
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


# Are these final four methods still too dependent on Airport class?
# I've tried to isolate them outside of the Plane's other methods

  def request_landing(airport)
    airport.allow_landing(self)
  end

  def request_take_off
    location.allow_take_off(self)
  end

  def check_whether_airport_is_full(airport)
    raise "There's no room at this airport, so we've had to destroy the plane. Sorry about that." if airport.full?
  end

  def put_new_plane_in_gate(airport)
    airport.gates << self
  end

end
