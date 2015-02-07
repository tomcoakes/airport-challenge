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

  it "should allow incoming planes to land" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    airport.allow_landing(boeing)
    expect(airport.gates).to eq([boeing])
  end

  it "should allow planes to take off" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    airport.allow_landing(boeing)
    expect(airport.gates).to eq([boeing]) 
    airport.allow_take_off(boeing)
    expect(airport.gates).to eq([])
  end

  it "should not allow planes to land when at max capacity" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    expect{ fill_all_gates }.to raise_error(RuntimeError, "The airport is full, you can't land yet")
    expect(airport.gates.count).to eq(20)
  end

  # it "shouldn't allow planes to take off when it's stormy" do
  #    airport.allow_landing(boeing)
  #    expect{ airport.allow_take_off(boeing)}.to raise_error("Can't land right now, there's a storm")
  # end

end