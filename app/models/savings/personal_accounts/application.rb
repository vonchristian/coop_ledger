# frozen_string_literal: true

module Savings
  module PersonalAccounts
    class Application < ApplicationRecord
      self.table_name = "personal_saving_applications"

      belongs_to :depositor,                class_name: "Personal::Person"
      belongs_to :interest_account,         class_name: "Accounting::Account"
      belongs_to :liability_account,        class_name: "Accounting::Account"
      belongs_to :saving_product
      belongs_to :office
    end
  end
end
