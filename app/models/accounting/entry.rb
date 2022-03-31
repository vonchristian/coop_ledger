# frozen_string_literal: true

module Accounting
  class Entry < ApplicationRecord
    belongs_to :office
    has_many :debit_amounts, class_name: "Accounting::Amounts::DebitAmount"
    has_many :credit_amounts, class_name: "Accounting::Amounts::CreditAmount"
  end
end
