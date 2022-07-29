# frozen_string_literal: true

require "rails_helper"

RSpec.describe Office, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :cooperative }
    it { is_expected.to have_many :personal_savings_account_applications }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end

  describe "enums" do
    it do
      is_expected.to define_enum_for(:office_type).with_values(
        {
          main_office: "main_office",
          branch_office: "branch_office",
          satellite_office: "sattelite_office",
        }
      ).backed_by_column_of_type(:string)
    end
  end
end
