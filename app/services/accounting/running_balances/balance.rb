# frozen_string_literal: true

module Accounting
  module RunningBalances
    class Balance
      DEFAULT_BALANCE_CLASS = "Default"
      BALANCE_CLASSES       = {
        "recording_date"                => "RecordingDate",
        "recording_date_recording_time" => "DateTimeRange"
      }

      attr_reader :balancer_args, :args

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @args = args
        @balancer_args = args.clone.except(:running_balances)
      end

      def run
        compute
      end

      private

      def compute
        balancer.execute(args)
      end

      def balancer
        klass = BALANCE_CLASSES[balancer_args.keys.join("_")] || DEFAULT_BALANCE_CLASS

        "::Accounting::RunningBalances::Balancers::#{klass}".constantize
      end
    end
  end
end