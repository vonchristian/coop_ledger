# frozen_string_literal: true

class Office < ApplicationRecord
  enum office_type: {
    main_office: "main_office",
    branch_office: "branch_office",
    satellite_office: "sattelite_office",
  }

  belongs_to :cooperative
  has_many :personal_savings_account_applications, class_name: "Savings::PersonalAccounts::Application"

  validates :name, presence: true
end
