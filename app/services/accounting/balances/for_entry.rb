# frozen_string_literal: true

module Accounting
  module Balances
    class ForEntry
      attr_reader :account, :entry

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @account = args.fetch(:account)
        @entry   = args.fetch(:entry)
      end

      def run
        compute
      end

      private

      def compute
        account.balance(to_date: entry.recording_date, to_time: entry.recording_time)
      end
    end
  end
end
