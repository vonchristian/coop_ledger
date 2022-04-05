module Accounting
  module Balances
    module Balancers
      class ToDateToTime
        attr_reader :from_date, :to_date, :from_time, :to_time, :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @from_date = Date.current - Date.current.year.years
          @to_date   = args.fetch(:to_date)
          @to_time   = args.fetch(:to_time)
          @amounts   = args.fetch(:amounts)
          @from_time = @to_date.beginning_of_day.to_time
        end

        def run
          Accounting::Balances::Balancers::DateTimeRange.execute(
            amounts:   amounts,
            from_date: from_date,
            to_date:   to_date,
            from_time: from_time,
            to_time:   to_time
          )
        end
      end
    end
  end
end
