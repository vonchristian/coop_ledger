# frozen_string_literal: true

module Accounting
  module NormalCreditBalance
    NORMAL_CREDIT_BALANCE = ['equity', 'liability', 'revenue'].freeze

    def normal_credit_balance
      NORMAL_CREDIT_BALANCE.include?(account_type)
    end
  end
end
