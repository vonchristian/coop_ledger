# frozen_string_literal: true

module Accounting
  module Balances
    class TrialBalance
      attr_reader :total_assets, :total_liabilities_and_equity, :net_income_or_loss

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @total_assets = args.fetch(:total_assets)
        @total_liabilities_and_equity = args.fetch(:total_liabilities_and_equity)
        @net_income_or_loss = args.fetch(:net_income_or_loss)
      end

      def run
        total_assets - total_liabilities_and_equity - net_income_or_loss
      end
    end
  end
end