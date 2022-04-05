# frozen_string_literal: true

module Accounting
  module RunningBalances
    module Balancers
      class Default
        attr_reader :balances

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @balances = args.fetch(:running_balances)
        end

        def run
          compute
        end

        private

        def compute
          balances
          .latest
          .balance
          .amount
        end
      end
    end
  end
end
