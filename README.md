# osm_data
Ruby objects for dealing with OSM data, and generating XML files

## Example
```ruby
node = OSMData::Node.new(id: -12, lat: 23, lon: 32)
way = OSMData::Way.new(id: -109, members: [node], tags: {route: 'bus', type: 'route'})
relation = OSMData::Relation.new(id: -23, members: [way], tags: {name: 'Bus 55'})

collection = OSMData::ElementCollection.new
collection << relation

collection.to_xml
```

Output:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<osm>
  <node id="-12" lat="23" lon="32"/>
  <way id="-109">
    <nd ref="-12"/>
    <tag k="route" v="bus"/>
    <tag k="type" v="route"/>
  </way>
  <relation id="-23">
    <member type="way" ref="-109"/>
    <tag k="name" v="Bus 55"/>
  </relation>
</osm>
```
