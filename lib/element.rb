module OSMData
  class InvalidMemberError < StandardError
  end

  class Element
    attr_accessor :members, :tags, :id

    def initialize(**args)
      @members = []
      @tags = {}

      args.each_pair do |k,v|
        accessor = :"#{k}="
        if self.respond_to?(accessor)
          if accessor == :"members="
            self << v
          else
            self.send(accessor, v)
          end
        end
      end
    end

    def valid_member_classes
      raise NotImplementError
    end

    def <<(members)
      members = Array(members)
      members.each do |member|
        raise InvalidMemberError unless valid_member?(member)
        next if @members.include?(member)
        @members << member
      end
    end

    private

    def valid_member?(member)
      valid_member_classes.include?(member.class)
    end
  end
end
