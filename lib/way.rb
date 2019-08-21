require_relative 'element'
require_relative 'node'

module OSMData
  class Way < Element
    def valid_member_classes
      [OSMData::Node]
    end
  end
end