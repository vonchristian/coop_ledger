# frozen_string_literal: true

module Accounting
  module RunningBalances
    module Balancers
      class DateTimeRange
        attr_reader :recording_date, :recording_time, :running_balances

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @running_balances = args.fetch(:running_balances)
          @recording_date   = args.fetch(:recording_date)
          @recording_time   = args.fetch(:recording_time)
        end

        def run
          compute
        end

        private

        def compute
          running_balances
            .includes(:entry)
            .where("entries.recording_date" => recording_date)
            .where("entries.recording_time" => recording_time)
            .latest
            .balance
            .amount
        end
      end
    end
  end
end
