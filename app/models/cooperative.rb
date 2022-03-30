# frozen_string_literal: true

class Cooperative < ApplicationRecord
  has_many :offices, dependent: :nullify

  validates :name, :abbreviated_name, presence: true
end
