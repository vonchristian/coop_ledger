# frozen_string_literal: true

module Accounting
  module Amounts
    class CreditAmount < ApplicationRecord
      belongs_to :entry
      belongs_to :account
    end
  end
end
