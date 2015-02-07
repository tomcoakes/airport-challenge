require 'plane'
require 'airport'

def take_off_all_six_planes
  plane1.take_off
  plane2.take_off
  plane3.take_off
  plane4.take_off
  plane5.take_off
  plane6.take_off
end

def land_all_six_planes
  plane1.land_at(airport)
  plane2.land_at(airport)
  plane3.land_at(airport)
  plane4.land_at(airport)
  plane5.land_at(airport)
  plane6.land_at(airport)
end

describe "The grand finale (last spec)" do
  
  let(:airport) {Airport.new}
  let(:plane1) {Plane.new(airport)}
  let(:plane2) {Plane.new(airport)}
  let(:plane3) {Plane.new(airport)}
  let(:plane4) {Plane.new(airport)}
  let(:plane5) {Plane.new(airport)}
  let(:plane6) {Plane.new(airport)}

  it "all planes can land and all planes can take off" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    expect(plane1).not_to be_flying
    expect(plane2).not_to be_flying
    expect(plane3).not_to be_flying
    expect(plane4).not_to be_flying
    expect(plane5).not_to be_flying
    expect(plane6).not_to be_flying
    take_off_all_six_planes
    expect(plane1).to be_flying
    expect(plane2).to be_flying
    expect(plane3).to be_flying
    expect(plane4).to be_flying
    expect(plane5).to be_flying
    expect(plane6).to be_flying
    land_all_six_planes
    expect(plane1).not_to be_flying
    expect(plane2).not_to be_flying
    expect(plane3).not_to be_flying
    expect(plane4).not_to be_flying
    expect(plane5).not_to be_flying
    expect(plane6).not_to be_flying
  end

end