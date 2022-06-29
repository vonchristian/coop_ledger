# frozen_string_literal: true

module Accounting
  module Balances
    module Balancers
      class DateRange
        attr_reader :date_range, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @date_range = args.fetch(:date_range)
          @amounts    = args.fetch(:amounts)
        end

        def run
          amounts
            .joins(:entry)
            .where("entries.recording_date" => date_range)
            .total
        end
      end
    end
  end
end
