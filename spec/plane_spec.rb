require 'plane'

describe Plane do
 
  let(:plane) {Plane.new(airport)}
  let(:plane_in_the_air) {double :plane_in_the_air, flying?: true}
  let(:airport) {double :airport, gates: []}

  context "Flying status" do

    it "is able to fly" do
      expect(plane_in_the_air).to be_flying
    end

    it "stops flying when it lands" do
      allow(airport).to receive(:full?)
      plane.land
      expect(plane).not_to be_flying
    end

    it "isn't already flying when created" do
      allow(airport).to receive(:full?)
      expect(plane).not_to be_flying
    end

    it "begins flying when it takes off" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_take_off).with(plane)
      plane.take_off
      expect(plane).to be_flying
    end

  end

  context "Dealing with airports" do

    it "is assigned a starting airport when created" do
      allow(airport).to receive(:full?)
      expect(plane.location).to eq(airport)
      expect(airport.gates).to include(plane)
    end

    it "is able to land at an airport" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_landing).with(plane)
      plane.land_at(airport)
    end

    it "knows which airport it's currently at" do
      allow(airport).to receive(:full?)
      allow(airport).to receive(:allow_landing)
      plane.land_at(airport)
      expect(plane.location).to eq(airport)
    end

    it "is able to take off" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_take_off)
      plane.take_off
    end

  end

end