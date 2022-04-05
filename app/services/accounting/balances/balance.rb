# frozen_string_literal: true

module Accounting
  module Balances
    module Balance
      def total
        Money.new(sum(:amount_cents)).amount
      end

      def balance(args = {})
        balancer(args).execute(args.merge(amounts: self))
      end

      def balancer(args = {})
        Accounting::Balances::Balancers::Base.execute(args)
      end

      def balance_for_new_record
        balance = BigDecimal("0")
        all.each do |amount_record|
          if amount_record.amount && !amount_record.marked_for_destruction?
            balance += amount_record.amount # unless amount_record.marked_for_destruction?
          end
        end
        balance
      end
    end
  end
end


