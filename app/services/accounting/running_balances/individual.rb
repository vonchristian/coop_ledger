# frozen_string_literal: true

module Accounting
  module RunningBalances
    module Individual
      def running_balance(args = {})
        return 0 if running_balances.empty?

        Accounting::RunningBalances::Balance.execute(args.merge!(running_balances: running_balances))
      end
    end
  end
end