# frozen_string_literal: true

module Accounting
  module Balances
    class NetIncomeOrLoss
      attr_reader :revenues, :expenses, :balance_args

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @revenues     = args.fetch(:revenues)
        @expenses     = args.fetch(:expenses)
        @balance_args = args.except(:revenues).except(:expenses)
      end

      def run
        compute
      end

      private

      def compute
        revenues.balance(balance_args) - expenses.balance(balance_args)
      end
    end
  end
end