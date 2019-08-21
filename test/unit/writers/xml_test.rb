require_relative "../../config"

describe OSMData::Writer::XML do
  let (:node) do
    OSMData::Node.new(id: -12, lat: 23, lon: 32)
  end

  let (:way) do
    OSMData::Way.new(id: -109, members: [node], tags: {route: 'bus', type: 'route'})
  end

  let (:col) {OSMData::ElementCollection.new}

  it 'should build a proper XML' do
    col << way
    expected_xml = <<XML
<?xml version="1.0"?>
<osm>
  <node id="-12" lat="23" lon="32"/>
  <way id="-109">
    <tag k="route" v="bus"/>
    <tag k="type" v="route"/>
  </way>
</osm>
XML

    assert_equal expected_xml, col.to_xml
  end
end
