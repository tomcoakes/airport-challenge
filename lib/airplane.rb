class Airplane

  def initialize
    @flying_status = true
  end

  def flying?
    @flying_status
  end

  def stop_flying
    @flying_status = false
  end

  def land_at(airport)
    airport.landing_plane(self)
    stop_flying
  end

end