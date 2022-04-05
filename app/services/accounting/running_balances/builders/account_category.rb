# frozen_string_literal: true

module Accounting
  module RunningBalances
    module Builders
      class AccountCategory
        attr_reader :account_category, :entry

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @account_category = args.fetch(:account_category)
          @entry            = args.fetch(:entry)
        end

        def run
          return if account_category.running_balances.exists?(entry: entry)

          create_running_balance
        end

        private

        def create_running_balance
          account_category.running_balances.create!(
            entry:          entry,
            balance:        balance,
            recording_date: entry.recording_date,
            recording_time: entry.recording_time
          )
        end

        def balance
          Accounting::Balances::ForEntry.execute(account: account_category, entry: entry)
        end
      end
    end
  end
end
