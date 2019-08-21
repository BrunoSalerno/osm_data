require_relative "../config"

describe OSMData::Node do
  let (:tags) {{highway: 'unclassified', name: 'Pastower Straße'}}

  it "should have lat, lon and default empty tags" do
    node = OSMData::Node.new(lat: 34,lon: 22)
    assert_equal 34, node.lat
    assert_equal 22, node.lon
    assert_empty node.tags
  end

  it "should set tags" do
    node = OSMData::Node.new(tags: tags)
    assert_equal tags, node.tags
  end
end
