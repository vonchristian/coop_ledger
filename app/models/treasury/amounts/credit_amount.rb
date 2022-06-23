# frozen_string_literal: true

module Treasury
  module Amounts
    class CreditAmount < ApplicationRecord
      self.table_name = "voucher_credit_amounts"

      belongs_to :account
    end
  end
end
