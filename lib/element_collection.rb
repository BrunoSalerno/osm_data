require_relative "node"
require_relative "way"
require_relative "writers/xml"

module OSMData
  class ElementCollection
    attr_reader :nodes, :ways, :relations

    include Writer::XML

    def initialize
      @nodes = []
      @ways = []
      @relations = []
    end

    def <<(elements)
      elements = Array(elements)
      elements.each do |element|
        destination = if element.is_a?(Node)
                        @nodes
                      elsif element.is_a?(Way)
                        @ways
                      elsif element.is_a?(Relation)
                        @relations
                      end
        push element, destination
      end
    end

    private

    def push(element, destination)
      return if destination.include?(element)
      destination.push(element)
      if [Way, Relation].include?(element.class)
        self << element.members
      end
    end
  end
end
