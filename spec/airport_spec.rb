require 'airport.rb'

describe Airport do
  
  let(:boeing) {double :boeing}

  it "should be able to hold airplanes at gates" do
    airport = Airport.new
    expect(airport.gates).to eq([])
  end

  it "should be able to land incoming planes" do
    airport = Airport.new
    airport.landing_plane(boeing)
    expect(airport.gates).to eq([boeing])
  end

end