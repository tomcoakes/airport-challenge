require 'airplane'

describe Airplane do
 
  let(:boeing) {Airplane.new}
  let(:empty_airport) {double :empty_airport, gates: []}
  let(:airport_with_one_plane) {double :airport_with_one_plane, gates: [boeing]}


  it "should be able to fly" do
    expect(boeing).to be_flying
  end

  it "should be able to be not flying" do
    boeing.stop_flying
    expect(boeing).not_to be_flying
  end

  it "should be able to land in an airport" do
    expect(empty_airport).to receive(:landing_plane).with(boeing)
    boeing.land_at(empty_airport)
  end

  it "should know what airport it is in" do
    allow(empty_airport).to receive(:landing_plane)
    boeing.land_at(empty_airport)
    expect(boeing.location).to eq(empty_airport)
  end

  it "should be able to take off" do
    expect(empty_airport).to receive(:landing_plane)
    boeing.land_at(empty_airport)
    expect(empty_airport).to receive(:leaving_plane)
    boeing.take_off
  end

  it "should be flying once it's taken off" do
    expect(empty_airport).to receive(:landing_plane)
    boeing.land_at(empty_airport)
    expect(empty_airport).to receive(:leaving_plane)
    boeing.take_off
    expect(boeing).to be_flying
  end

end