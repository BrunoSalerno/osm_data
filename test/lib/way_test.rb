require_relative "../config"

describe OSMData::Way do
  let (:way) {OSMData::Way.new}
  let (:node) {OSMData::Node.new(lat: 23, lon: 22)}

  it "should allow node members" do
    way << node
    assert_equal [node], way.members
  end

  #it "shouldn't allow other kind of members" do

  #end
end
