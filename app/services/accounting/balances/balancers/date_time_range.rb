module Accounting
  module Balances
    module Balancers
      class DateTimeRange
        attr_reader :from_date, :to_date, :from_time, :to_time, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @from_date = args.fetch(:from_date)
          @to_date   = args.fetch(:to_date)
          @from_time = args.fetch(:from_time)
          @to_time   = args.fetch(:to_time)
          @amounts   = args.fetch(:amounts)
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

        def date_range
          DateRangeParser.new(from_date: from_date, to_date: to_date).range
        end

        def time_range
          TimeRangeParser.new(from_time: from_time, to_time: to_time).range
        end
      end
    end
  end
end
