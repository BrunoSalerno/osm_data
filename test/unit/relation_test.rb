require_relative "../config"

describe OSMData::Relation do
  let (:way) {OSMData::Way.new}
  let (:rel) {OSMData::Relation.new}
  let (:rel2) {OSMData::Relation.new}
  let (:node) {OSMData::Node.new(lat: 23, lon: 22)}

  it "should have tags" do
    rel.tags = ['a tag']
    assert_equal ['a tag'], rel.tags
  end

  it "should allow ways and nodes as members" do
    rel << way
    rel << node
    assert_equal [way, node], rel.members
  end

  it "should allow ways and nodes as members in arrays" do
    rel << [way, node]
    assert_equal [way, node], rel.members
  end

  it "shouldn't allow other kind of members" do
    assert_raises OSMData::InvalidMemberError do
      rel << rel2
    end
  end
end
