# frozen_string_literal: true

module Accounting
  class AccountCategory < ApplicationRecord
    has_many :accounts, dependent: :nullify
    belongs_to :office
  end
end
