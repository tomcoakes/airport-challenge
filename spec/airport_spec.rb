require 'airport.rb'

def fill_all_gates
  21.times {airport.allow_landing(boeing)}
end

describe Airport do
  
  let(:boeing) {double :boeing}
  let(:airport) {Airport.new}

  it "should be able to hold airplanes at gates" do
    expect(airport.gates).to eq([])
  end

  it "should be able to land incoming planes" do
    airport.allow_landing(boeing)
    expect(airport.gates).to eq([boeing])
  end

  it "should allow planes to take off" do
    airport.allow_landing(boeing)
    expect(airport.gates).to eq([boeing]) 
    airport.allow_take_off(boeing)
    expect(airport.gates).to eq([])
  end

  it "should not allow any planes to land when at max capacity" do
    expect{ fill_all_gates }.to raise_error(RuntimeError, "The airport is full, you can't land yet")
  end

end