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
                refs_for way, xml
                tags_for way, xml
              }
            end
            relations.map do |relation|
              xml.relation(id: relation.id) {
                refs_for relation, xml
                tags_for relation, xml
              }
            end
          }
        end

        builder.to_xml
      end

      private

      def refs_for(element, xml)
        element.members.each do |member|
          if element.is_a?(Way)
            xml.nd(ref: member.id)
          elsif element.is_a?(Relation)
            xml.member(type: member.class.name.downcase.split('::').last, ref: member.id)
          end
        end
      end

      def tags_for(element, xml)
        element.tags.each do |k,v|
          xml.tag(k: k, v: v)
        end
      end
    end
  end
end
