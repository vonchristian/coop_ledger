# frozen_string_literal: true

require "rails_helper"

module Accounting
  module AccountCategories
    RSpec.describe RunningBalance, type: :model do
      describe "associations" do
        it { is_expected.to belong_to :account_category }
      end
    end
  end
end
