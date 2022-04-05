# frozen_string_literal: true

module Accounting
  module Balances
    class TotalLiabilitiesAndEquity
      attr_reader :liabilities, :equities, :balance_args

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @liabilities  = args.fetch(:liabilities)
        @equities     = args.fetch(:equities)
        @balance_args = args.except(:liabilities).except(:equities)
      end

      def run
        compute
      end

      private

      def compute
        liabilities.balance(balance_args) + equities.balance(balance_args)
      end
    end
  end
end