require 'plane'

describe Plane do
 
  let(:plane) {Plane.new(airport)}
  let(:plane_in_the_air) {double :plane_in_the_air, flying?: true}
  let(:airport) {double :airport, gates: []}

  context "Flying status" do

    it "should be able to fly" do
      expect(plane_in_the_air).to be_flying
    end

    it "should be able to be 'not flying'" do
      allow(airport).to receive(:full?)
      plane.land
      expect(plane).not_to be_flying
    end

    it "should not be flying when created" do
      allow(airport).to receive(:full?)
      expect(plane).not_to be_flying
    end

    it "should be flying once it's taken off" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_take_off).with(plane)
      plane.take_off
      expect(plane).to be_flying
    end

  end

  context "Dealing with airports" do

    it "should be in an airport's gate when created" do
      allow(airport).to receive(:full?)
      expect(plane.location).to eq(airport)
      expect(airport.gates).to include(plane)
    end

    it "should be able to land at an airport" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_landing).with(plane)
      plane.land_at(airport)
    end

    it "should know what airport it is in" do
      allow(airport).to receive(:full?)
      allow(airport).to receive(:allow_landing)
      plane.land_at(airport)
      expect(plane.location).to eq(airport)
    end

    it "should be able to take off" do
      allow(airport).to receive(:full?)
      expect(airport).to receive(:allow_take_off)
      plane.take_off
    end

  end

end