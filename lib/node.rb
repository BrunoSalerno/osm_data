require_relative 'element'

module OSMData
  class Node < Element
    attr_accessor :lat, :lon
  end
end
