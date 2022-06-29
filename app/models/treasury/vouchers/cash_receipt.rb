# frozen_string_literal: true

module Treasury
  module Vouchers
    class CashReceipt < ApplicationRecord
      self.table_name = "cash_receipt_vouchers"

      belongs_to :office
      belongs_to :employee
    end
  end
end
