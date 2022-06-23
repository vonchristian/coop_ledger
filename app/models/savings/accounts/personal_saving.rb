# frozen_string_literal: true

module Savings
  module Accounts
    class PersonalSaving < ApplicationRecord
      belongs_to :depositor, class_name: "Person"
      belongs_to :saving_product
      belongs_to :liability_account
      belongs_to :interest_expense_account
      belongs_to :office
    end
  end
end
