module OSMData
  module Writer
    module XML
      require 'nokogiri'

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.osm {
            nodes.map do |node|
              xml.node(id: node.id, lat: node.lat, lon: node.lon) {
                tags_for node, xml
              }
            end
            ways.map do |way|
              xml.way(id: way.id) {
                tags_for way, xml
              }
            end
            relations.map do |relation|
              xml.relation(id: relation.id) {
                tags_for relation, xml
              }
            end
          }
        end

        builder.to_xml
      end

      private

      def tags_for(element, xml)
        element.tags.each do |k,v|
          xml.tag(k: k, v: v)
        end
      end
    end
  end
end
