require 'plane'
require 'airport'

def take_off_all_six_planes
  all_planes.each {|plane| plane.take_off}
end

def land_all_six_planes
  all_planes.each {|plane| plane.land_at(airport)}
end

describe "The grand finale (last spec)" do
  
  let(:airport) {Airport.new}
  let(:plane1) {Plane.new(airport)}
  let(:plane2) {Plane.new(airport)}
  let(:plane3) {Plane.new(airport)}
  let(:plane4) {Plane.new(airport)}
  let(:plane5) {Plane.new(airport)}
  let(:plane6) {Plane.new(airport)}
  let(:all_planes) {[plane1, plane2, plane3, plane4, plane5, plane6]}

  it "all planes can land and all planes can take off" do
    allow(airport).to receive(:there_is_a_storm?) {false}
    all_planes.each {|plane| expect(plane).not_to be_flying}
    take_off_all_six_planes
    all_planes.each {|plane| expect(plane).to be_flying}
    land_all_six_planes
    all_planes.each {|plane| expect(plane).not_to be_flying}
  end

end