require 'weather'

class TestWeather; include Weather; end

describe Weather do

  let(:weather) {TestWeather.new}

  # it "should know what the current weather is" do
  #   expect(weather.current_weather).to eq("sunny")
  # end

end

