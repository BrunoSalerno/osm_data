require_relative 'element'
require_relative 'way'

module OSMData
  class Relation < Element
    def valid_member_classes
      [Node, Way]
    end
  end
end
