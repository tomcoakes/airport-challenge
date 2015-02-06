class Airport

  def gates
    @gates ||= []
  end

  def landing_plane(plane)
    gates << plane
  end

end