# frozen_string_literal: true

module Treasury
  module Amounts
    class DebitAmount < ApplicationRecord
      self.table_name = "voucher_debit_amounts"

      belongs_to :account
    end
  end
end
