# frozen_string_literal: true

module Accounting
  module RunningBalances
    module Builders
      class Account
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
          return if account.running_balances.exists?(entry: entry)

          create_running_balance
        end

        private

        def create_running_balance
          account.running_balances.create!(
            entry:          entry,
            amount:        total_amount,
            recording_date: entry.recording_date,
            recording_time: entry.recording_time
          )
        end

        def total_amount
          Accounting::Balances::ForEntry.execute(account: account, entry: entry)
        end
      end
    end
  end
end
