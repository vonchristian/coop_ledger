# frozen_string_literal: true

module Accounting
  module Balances
    module Balancers
      class ToDateToTime
        attr_reader :to_date, :to_time, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @to_date   = args.fetch(:to_date)
          @to_time   = args.fetch(:to_time)
          @amounts   = args.fetch(:amounts)
        end

        def run
          Accounting::Balances::Balancers::DateTimeRange.execute(
            amounts:    amounts,
            date_range: date_range,
            time_range: time_range
          )
        end

        def date_range
          DateRangeParser.new(from_date: from_date, to_date: to_date).range
        end

        def time_range
          TimeRangeParser.new(from_time: from_time, to_time: to_time).range
        end

        def from_time
          to_date.beginning_of_day.to_time
        end

        def from_date
          Date.current - Date.current.year.years
        end
      end
    end
  end
end
