module OSMData
  class Element
    attr_accessor :members, :tags, :id

    def initialize(**args)
      @members = []
      @tags = []

      args.each_pair do |k,v|
        accessor = :"#{k}="
        if self.respond_to?(accessor)
          self.send(accessor, v)
        end
      end
    end

    def <<(member)
      @members << member
    end
  end
end
