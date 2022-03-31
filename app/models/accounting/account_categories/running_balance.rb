# frozen_string_literal: true

module Accounting
  module AccountCategories
    class RunningBalance < ApplicationRecord
      self.table_name = "account_category_running_balances"

      monetize :amount_cents, as: :amount

      belongs_to :account_category

      validates :amount, :recording_date, :recording_time, presence: true
    end
  end
end
