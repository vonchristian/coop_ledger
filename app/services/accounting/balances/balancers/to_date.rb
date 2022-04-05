module Accounting
  module Balances
    module Balancers
      class ToDate
        attr_reader :from_date, :to_date, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @from_date = Date.current - Date.current.year.years
          @to_date   = args.fetch(:to_date)
          @amounts   = args.fetch(:amounts)
          @amounts   = amounts
        end

        def run
          compute
        end

        def compute
          Accounting::Balances::Balancers::DateRange.execute(
            amounts: amounts,
            from_date: from_date,
            to_date: to_date
          )
        end
      end
    end
  end
end
