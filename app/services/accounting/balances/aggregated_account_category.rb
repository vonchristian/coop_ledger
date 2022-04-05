# frozen_string_literal: true

module Accounting
  module Balances
    module AggregatedAccountCategory
      def balance(args = {})
        total = BigDecimal('0')

        all.each do |account|
          if account.subtree.size > 1
            account.subtree.each do |account|
              if account.contra?
                total -= account.balance(args)
              else
                total += account.balance(args)
              end
            end
          end

          if account.contra?
            total -= account.balance(args)
          else
            total += account.balance(args)
          end
        end
        total
      end
    end
  end
end
