# frozen_string_literal: true

module Accounting
  module Balances
    module Balancers
      class FindBalancer
        PREFIX = "::Accounting::Balances::Balancers::"
        DEFAULT_BALANCE_CLASS = "Default"
        BALANCE_CLASSES = {
          from_date_to_date:                    "DateRange",
          from_date_from_time_to_date_to_time: "DateTimeRange",
          to_date:                             "ToDate",
          to_date_to_time:                     "ToDateToTime",
        }

        attr_reader :sorted_args

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @sorted_args = args.keys.sort.join("_").to_sym
        end

        def run
          if sorted_args.present? && BALANCE_CLASSES.keys.exclude?(sorted_args)
            raise StandardError, "Invalid arguments. Must be #{BALANCE_CLASSES.keys}"
          end

          "#{PREFIX}#{find_class}".constantize
        end

        def find_class
          if sorted_args.empty?
            DEFAULT_BALANCE_CLASS
          else
            BALANCE_CLASSES[sorted_args]
          end
        end
      end
    end
  end
end
