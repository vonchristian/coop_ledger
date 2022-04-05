# frozen_string_literal: true

module Accounting
  module Balances
    module Individual
      def balance(args = {})
        if normal_credit_balance ^ contra?
          credits_balance(args) - debits_balance(args)
        else
          debits_balance(args) - credits_balance(args)
        end
      end

      def credits_balance(args = {})
        all_credit_amounts.balance(args)
      end

      def debits_balance(args = {})
        all_debit_amounts.balance(args)
      end
    end
  end
end
