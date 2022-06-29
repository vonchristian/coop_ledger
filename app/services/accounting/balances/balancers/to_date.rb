# frozen_string_literal: true

module Accounting
  module Balances
    module Balancers
      class ToDate
        attr_reader :to_date, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @to_date   = args.fetch(:to_date)
          @amounts   = args.fetch(:amounts)
        end

        def run
          compute
        end

        def compute
          Accounting::Balances::Balancers::DateRange.execute(
            amounts: amounts,
            date_range: date_range
          )
        end

        def date_range
          DateRangeParser.new(from_date: from_date, to_date: to_date).range
        end

        def from_date
          Date.current - Date.current.year.years
        end
      end
    end
  end
end
