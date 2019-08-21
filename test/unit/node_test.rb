require_relative "../config"

describe OSMData::Node do
  it "should have lat, lon and tags" do
    node = OSMData::Node.new(lat: 34,lon: 22, tags: ['route'])
    assert_equal 34, node.lat
    assert_equal 22, node.lon
    assert_equal ['route'], node.tags
  end
end
