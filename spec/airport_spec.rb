require 'airport'

def fill_all_gates
  7.times {airport.allow_landing(plane)}
end

describe Airport do
  
  let(:plane) {double :plane}
  let(:airport) {Airport.new}


  context "Gates" do

    it "is able to hold planes at gates" do
      expect(airport.gates).to eq([])
    end

    it "knows how many gates are in use" do
      allow(airport).to receive(:there_is_a_storm?) {false}
      airport.allow_landing(plane)
      expect(airport.gates_in_use).to eq(1)
    end

  end

  context "Traffic Control" do

    it "allows incoming planes to land" do
      allow(airport).to receive(:there_is_a_storm?) {false}
      airport.allow_landing(plane)
      expect(airport.gates).to eq([plane])
    end

    it "allows planes to take off" do
      allow(airport).to receive(:there_is_a_storm?) {false}
      airport.allow_landing(plane)
      expect(airport.gates).to eq([plane]) 
      airport.allow_take_off(plane)
      expect(airport.gates).to eq([])
    end

    it "doesn't allow planes to land when at max capacity" do
      allow(airport).to receive(:there_is_a_storm?) {false}
      expect{fill_all_gates}.to raise_error "The airport is full, you can't land yet"
      expect(airport.gates.count).to eq(6)
    end

  end

  context "Stormy Weather" do

    it "doesn't allow planes to land when it's stormy" do
      allow(airport).to receive(:there_is_a_storm?) {true}
      expect{airport.allow_landing(plane)}.to raise_error "You can't land right now, there's a storm"
    end

    it "doesn't allow planes to take off when it's stormy" do
       allow(airport).to receive(:there_is_a_storm?) {true}
       expect{ airport.allow_take_off(plane)}.to raise_error "You can't take off right now, there's a storm"
    end


  end
end