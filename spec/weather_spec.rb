require 'weather'

class TestWeather; include Weather; end

describe Weather do

  let(:weather) {TestWeather.new}

  it "is sometimes stormy" do
    allow(weather).to receive(:is_stormy?) {true}
    expect(weather.is_stormy?).to eq true
  end

  it "is sometimes sunny" do
    allow(weather).to receive(:is_stormy?) {false}
    expect(weather.is_stormy?).to eq false
  end

end

