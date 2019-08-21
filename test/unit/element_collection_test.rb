require_relative "../config"

describe OSMData::ElementCollection do
  let (:nodes) do
    Array.new(5) {|i| OSMData::Node.new(lat: 20 + i, lon: 30 + i) }
  end

  let (:way1) do
    w = OSMData::Way.new
    w << nodes[0..1]
    w
  end

  let (:way2) do
    w = OSMData::Way.new
    w << nodes[2..3]
    w
  end

  let (:rel) do
    r = OSMData::Relation.new
    r << way1
    r
  end

  let (:col) {OSMData::ElementCollection.new}

  it "should accept nodes and organize them well" do
    col << nodes[1..3]
    assert_equal nodes[1..3], col.nodes
  end

  it "should accept ways and organize them well" do
    col << way1
    assert_equal nodes[0..1], col.nodes
    assert_equal [way1], col.ways
  end

  it "should accept relations and organize them well" do
    col << rel
    assert_equal nodes[0..1], col.nodes
    assert_equal [way1], col.ways
    assert_equal [rel], col.relations
  end

  it "should accept several elements at the same time" do
    col << [way1, way2]
    assert_equal nodes[0..3], col.nodes
    assert_equal [way1, way2], col.ways
  end

  it "shouldn't accept duplicated elements" do
    col << [way1, way1]
    assert_equal nodes[0..1], col.nodes
    assert_equal [way1], col.ways
  end

  it "shouldn't accept duplicated nodes" do
    col << way1
    col << nodes[0]
    assert_equal nodes[0..1], col.nodes
    assert_equal [way1], col.ways
  end
end
