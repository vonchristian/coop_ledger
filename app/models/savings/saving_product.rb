# frozen_string_literal: true

module Savings
  class SavingProduct < ApplicationRecord
    belongs_to :cooperative

    validates :name, :description, presence: true
  end
end
