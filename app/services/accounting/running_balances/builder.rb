# frozen_string_literal: true

module Accounting
  module RunningBalances
    class Builder
      attr_reader :entry

      def self.execute(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @entry = args.fetch(:entry)
      end

      def run
        create_running_balances
      end

      private

      def create_running_balances
        entry.accounts.each do |account|
          create_account_running_balance(account)
          create_account_category_running_balance(account.account_category)
        end
      end

      def create_account_running_balance(account)
        Builders::Account.execute(account: account, entry: entry)
      end

      def create_account_category_running_balance(account_category)
        if account_category.ancestors.present?
          account_category.ancestors.each do |account_category|
            Builders::AccountCategory.execute(account_category: account_category, entry: entry, recording_date: entry.recording_date, recording_time: entry.recording_time)
          end
        end

        Builders::AccountCategory.execute(account_category: account_category, entry: entry, recording_date: entry.recording_date, recording_time: entry.recording_time)
      end
    end
  end
end
