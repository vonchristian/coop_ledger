# frozen_string_literal: true

class Office < ApplicationRecord
  enum office_type: {
    main_office: "main_office",
    branch_office: "branch_office",
    satellite_office: "sattelite_office",
  }

  belongs_to :cooperative

  validates :name, presence: true
end
