module Weather

  def current_weather
    if is_stormy?
      @current_weather = "stormy"
    else
      @current_weather = "sunny"
    end
  end

  def is_stormy?
    rand(100) < 30 
  end

end