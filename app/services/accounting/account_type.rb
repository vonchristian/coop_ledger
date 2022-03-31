# frozen_string_literal: true

module Accounting
  class AccountType
    ASSET     = "asset"
    LIABILITY = "liability"
    EQUITY    = "equity"
    REVENUE   = "revenue"
    EXPENSE   = "expense"
    ACCOUNT_TYPES = [ASSET, LIABILITY, EQUITY, REVENUE, EXPENSE].freeze
  end
end
