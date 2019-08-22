require_relative "../config"

describe OSMData::Way do
  let (:way) {OSMData::Way.new}
  let (:way2) {OSMData::Way.new}
  let (:node) {OSMData::Node.new(lat: 23, lon: 22)}
  let (:tags) {{highway: 'unclassified', name: 'Pastower Straße'}}

  it "should have tags" do
    way.tags = tags
    assert_equal tags, way.tags
  end

  it "should allow node members" do
    way << node
    assert_equal [node], way.members
  end

  it "should allow node members in arrays" do
    way << [node]
    assert_equal [node], way.members
  end

  it "should allow node members on instantiation" do
    w = OSMData::Way.new(members: [node])
    assert_equal [node], w.members
  end

  it "shouldn't allow other kind of members" do
    assert_raises OSMData::InvalidMemberError do
      way << way2
    end
  end

  it "shouldn't allow duplicated members" do
    way << [node, node]
    assert_equal [node], way.members
  end
end
