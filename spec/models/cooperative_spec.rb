# frozen_string_literal: true

require "rails_helper"

RSpec.describe Cooperative, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:offices).dependent(:nullify) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :abbreviated_name }
  end
end
