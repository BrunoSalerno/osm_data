module OSMData
  module Writer
    module XML
      require 'nokogiri'

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.osm {
            nodes.map do |node|
              xml.node('id' => node.id, 'lat'=> node.lat, 'lon' => node.lon)
            end
            ways.map do |way|
              xml.way('id' => way.id)
            end
            relations.map do |relation|
              xml.relation('id' => way.id)
            end
          }
        end
      end
    end
  end
end
