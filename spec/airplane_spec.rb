require 'airplane'

describe Airplane do
 
  let(:boeing) {Airplane.new}
  let(:stansted) {double :stansted}

  it "should be able to fly" do
    expect(boeing).to be_flying
  end

  it "should be able to be not flying" do
    boeing.stop_flying
    expect(boeing).not_to be_flying
  end

  it "should be able to land in an airport" do
    expect(stansted).to receive(:landing_plane).with(boeing)
    boeing.land_at(stansted)
  end

end