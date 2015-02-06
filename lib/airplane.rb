class Airplane

  def initialize
    @flying_status = true
  end

  def flying?
    @flying_status
  end

  def flying=(value)
    @flying_status = value
  end

  def stop_flying
    @flying_status = false
  end

  def land_at(airport)
    airport.landing_plane(self)
    stop_flying
    @location = airport
  end

  def location
    @location
  end

  def take_off
    location.leaving_plane
    self.flying = true
  end

end