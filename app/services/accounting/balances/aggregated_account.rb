# frozen_string_literal: true

module Accounting
  module Balances
    module AggregatedAccount
      def balance(args = {})
        accounts_balance = BigDecimal("0")

        all.each do |account|
          if account.contra?
            accounts_balance -= account.balance(args)
          else
            accounts_balance += account.balance(args)
          end
        end
        accounts_balance
      end
    end
  end
end
