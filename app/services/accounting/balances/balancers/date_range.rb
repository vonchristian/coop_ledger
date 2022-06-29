# frozen_string_literal: true

module Accounting
  module Balances
    module Balancers
      class DateRange
        attr_reader :from_date, :to_date, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @from_date = args.fetch(:from_date)
          @to_date   = args.fetch(:to_date)
          @amounts   = args.fetch(:amounts)
        end

        def run
          amounts
            .joins(:entry)
            .where("entries.recording_date" => date_range)
            .total
        end

        def date_range
          DateRangeParser.new(from_date: from_date, to_date: to_date).range
        end
      end
    end
  end
end
