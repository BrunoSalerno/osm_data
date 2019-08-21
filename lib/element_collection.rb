require_relative "node"
require_relative "way"

module OSMData
  class ElementCollection
    attr_reader :nodes, :ways, :relations

    def initialize
      @nodes = []
      @ways = []
      @relations = []
    end

    def <<(elements)
      elements = Array(elements)
      elements.each do |element|
        if element.is_a?(Node)
          @nodes << element
        elsif element.is_a?(Way)
          @ways << element
          self << element.members
        elsif element.is_a?(Relation)
          @relations << element
          self << element.members
        end
      end
    end
  end
end
