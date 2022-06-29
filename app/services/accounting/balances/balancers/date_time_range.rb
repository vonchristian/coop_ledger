module Accounting
  module Balances
    module Balancers
      class DateTimeRange
        attr_reader :date_range, :time_range, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @date_range = args.fetch(:date_range)
          @time_range = args.fetch(:time_range)
          @amounts    = args.fetch(:amounts)
        end

        def run
          compute
        end

        private

        def compute
          amounts
            .joins(:entry)
            .where("entries.recording_date" => date_range)
            .where("entries.recording_time" => time_range)
            .total
        end
      end
    end
  end
end
