require_relative 'element'
require_relative 'node'

module OSMData
  class Way < Element
    def <<(member)
      raise "Invalid member" unless member.is_a?(OSMData::Node)
      super
    end
  end
end
