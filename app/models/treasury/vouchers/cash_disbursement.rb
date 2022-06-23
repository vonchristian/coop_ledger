# frozen_string_literal: true

module Treasury
  module Vouchers
    class CashDisbursement < ApplicationRecord
      self.table_name = "cash_disbursement_vouchers"
      belongs_to :office
      belongs_to :employee
    end
  end
end
