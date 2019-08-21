module OSMData
  module Writer
    module XML
      require 'nokogiri'

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.osm {
            nodes.map do |node|
              xml.node(id: node.id, lat: node.lat, lon: node.lon) {
                node.tags.each do |k,v|
                  xml.tag(k: k, v: v)
                end
              }
            end
            ways.map do |way|
              xml.way(id: way.id){
                way.tags.each do |k,v|
                  xml.tag(k: k, v: v)
                end
              }
            end
            relations.map do |relation|
              xml.relation(id: relation.id) {
                relation.tags.each do |k,v|
                  xml.tag(k: k, v: v)
                end
              }
            end
          }
        end

        builder.to_xml
      end
    end
  end
end
