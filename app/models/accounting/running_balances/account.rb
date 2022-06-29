# frozen_string_literal: true

module Accounting
  module RunningBalances
    class Account < ApplicationRecord
      self.table_name = 'account_running_balances'

      monetize :amount_cents, as: :amount

      belongs_to :entry,   class_name: "Accounting::Entry"
      belongs_to :account, class_name: 'Accounting::Account'

      validates :entry_id, uniqueness: { scope: :account_id }

      validates :amount_cents, presence: true, numericality: true

      def self.latest
        order(recording_date: :desc)
        .order(recording_time: :desc)
        .first
      end
    end
  end
end

