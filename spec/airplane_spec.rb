require 'airplane'

describe Airplane do
 
  let(:plane) {Airplane.new(empty_airport)}
  let(:plane_in_the_air) {double :plane_in_the_air, flying?: true}
  let(:empty_airport) {double :empty_airport, gates: []}
  let(:airport_with_one_plane) {double :airport_with_one_plane, gates: [plane]}


  it "should be able to fly" do
    expect(plane_in_the_air).to be_flying
  end

  it "should be able to be 'not flying'" do
    plane.stop_flying
    expect(plane).not_to be_flying
  end

  it "should not be flying when created" do
    expect(plane).not_to be_flying
  end

  it "should be created in an airport" do
    expect(plane.location).to eq(empty_airport)
  end

  it "should be able to land in an airport" do
    expect(empty_airport).to receive(:allow_landing).with(plane)
    plane.land_at(empty_airport)
  end

  it "should know what airport it is in" do
    allow(empty_airport).to receive(:allow_landing)
    plane.land_at(empty_airport)
    expect(plane.location).to eq(empty_airport)
  end

  it "should be able to take off" do
    expect(empty_airport).to receive(:allow_landing)
    plane.land_at(empty_airport)
    expect(empty_airport).to receive(:allow_take_off)
    plane.take_off
  end

  it "should be flying once it's taken off" do
    expect(empty_airport).to receive(:allow_landing).with(plane)
    plane.land_at(empty_airport)
    expect(empty_airport).to receive(:allow_take_off).with(plane)
    plane.take_off
    expect(plane).to be_flying
  end

end