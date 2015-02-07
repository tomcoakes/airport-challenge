require 'airport.rb'

def fill_all_gates
  21.times {airport.allow_landing(plane)}
end

describe Airport do
  
  let(:plane) {double :plane}
  let(:airport) {Airport.new}

  it "should be able to hold airplanes at gates" do
    expect(airport.gates).to eq([])
  end

  it "should allow incoming planes to land" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    airport.allow_landing(plane)
    expect(airport.gates).to eq([plane])
  end

  it "should allow planes to take off" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    airport.allow_landing(plane)
    expect(airport.gates).to eq([plane]) 
    airport.allow_take_off(plane)
    expect(airport.gates).to eq([])
  end

  it "should not allow planes to land when at max capacity" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    expect{fill_all_gates}.to raise_error "The airport is full, you can't land yet"
    expect(airport.gates.count).to eq(20)
  end

  context "Stormy weather" do

    it "should not allow planes to land when it's stormy" do
      allow(airport).to receive(:there_is_a_storm?) {true}
      expect{airport.allow_landing(plane)}.to raise_error "You can't land right now, there's a storm"
    end

    # it "shouldn't allow planes to take off when it's stormy" do
    #    airport.allow_landing(plane)
    #    expect{ airport.allow_take_off(plane)}.to raise_error("Can't land right now, there's a storm")
    # end


  end
end