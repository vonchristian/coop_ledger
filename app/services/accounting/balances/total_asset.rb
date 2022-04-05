# frozen_string_literal: true

module Accounting
  module Balances
    class TotalAsset
      attr_reader :assets, :balance_args

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @assets = args.fetch(:assets)
        @balance_args = args.except(:assets)
      end

      def run
        compute
      end

      private

      def compute
        assets.balance(balance_args)
      end
    end
  end
end