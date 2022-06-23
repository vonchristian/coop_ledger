# frozen_string_literal: true

module Treasury
  class CashAccount < ApplicationRecord
    self.table_name = "employee_cash_accounts"
    belongs_to :account, class_name: "Accounting::Account"
  end
end
