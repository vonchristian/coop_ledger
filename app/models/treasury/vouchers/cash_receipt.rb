class CashReceiptVoucher < ApplicationRecord
  belongs_to :office
  belongs_to :employee
end
