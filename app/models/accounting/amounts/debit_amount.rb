# frozen_string_literal: true

module Accounting
  module Amounts
    class DebitAmount < ApplicationRecord
      extend Accounting::Balances::Balance

      monetize :amount_cents, as: :amount

      belongs_to :entry
      belongs_to :account
    end
  end
end
