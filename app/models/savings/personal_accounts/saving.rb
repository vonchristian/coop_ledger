# frozen_string_literal: true

module Savings
  module PersonalAccounts
    class Saving < ApplicationRecord
      self.table_name = "personal_savings"

      belongs_to :depositor,                class_name: "Personal::Person"
      belongs_to :interest_account, class_name: "Accounting::Account"
      belongs_to :liability_account,        class_name: "Accounting::Account"
      belongs_to :office
      belongs_to :saving_product
    end
  end
end
