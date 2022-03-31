# frozen_string_literal: true

module Accounting
  module Amounts
    class DebitAmount < ApplicationRecord
      belongs_to :entry
      belongs_to :account
    end
  end
end
