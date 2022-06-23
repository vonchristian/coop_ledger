# frozen_string_literal: true

module Savings
  class Application < ApplicationRecord
    self.table_name = "saving_applications"

    belongs_to :member
    belongs_to :saving_product
    belongs_to :liability_account
    belongs_to :interest_expense_account
    belongs_to :office
  end
end
