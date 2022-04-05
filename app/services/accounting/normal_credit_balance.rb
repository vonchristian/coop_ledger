# frozen_string_literal: true

module Accounting
  module NormalCreditBalance
    NORMAL_CREDIT_BALANCE = [
      Accounting::AccountType::EQUITY,
      Accounting::AccountType::LIABILITY,
      Accounting::AccountType::REVENUE,
    ].freeze

    def normal_credit_balance
      NORMAL_CREDIT_BALANCE.include?(account_type)
    end
  end
end
