# frozen_string_literal: true

module Accounting
  module RunningBalances
    class AccountCategory < ApplicationRecord
      self.table_name = "account_category_running_balances"

      monetize :amount_cents, as: :amount

      belongs_to :account_category, class_name: "Accounting::AccountCategory"
      belongs_to :entry,            class_name: "Accounting::Entry"

      validates :entry_id, uniqueness: { scope: :account_category_id }
      validates :amount_cents, presence: true, numericality: true

      def self.latest
        order(recording_date: :desc)
          .order(recording_time: :desc)
          .first
      end
    end
  end
end
