# frozen_string_literal: true

module Accounting
  module Amounts
    class DebitAmount < ApplicationRecord
      extend Accounting::Balances::Balance

      monetize :amount_cents, as: :amount

      belongs_to :entry
      belongs_to :account

      validates :amount_cents, numericality: { greater_than: 0.0 }
    end
  end
end
