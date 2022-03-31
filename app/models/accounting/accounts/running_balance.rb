# frozen_string_literal: true

module Accounting
  module Accounts
    class RunningBalance < ApplicationRecord
      self.table_name = "account_running_balances"

      monetize :amount_cents, as: :amount

      belongs_to :account
    end
  end
end
