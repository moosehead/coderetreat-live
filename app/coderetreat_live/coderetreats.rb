module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.running_today
      coderetreats = Object.new
      def coderetreats.not_started(&block)
        [
          Coderetreat.new("not_started", "Chicago"),
          Coderetreat.new("not_started", "Seattle")
        ].each(&block)
      end
      def coderetreats.in_session(&block)
        [
          Coderetreat.new("in_session", "Berlin")
        ].each(&block)
      end
      coderetreats
    end

    Collection = Struct.new(:coderetreats) do
      def empty?
        self.coderetreats.empty?
      end
      def not_started
        self.by_status :not_started
      end
      def in_session
        self.by_status :in_session
      end
      def by_status(status)
        self.coderetreats.select{|coderetreat| coderetreat.status.to_sym == status}
      end
    end
    def self.for_collection(coderetreats)
      Collection.new(coderetreats)
    end
  end
end
