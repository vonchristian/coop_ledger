# frozen_string_literal: true

require "rails_helper"

RSpec.describe Saving, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :depositor }
  end
end
