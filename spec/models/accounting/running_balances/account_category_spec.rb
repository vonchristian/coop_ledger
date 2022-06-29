# frozen_string_literal: true

require "rails_helper"

module Accounting
  module RunningBalances
    RSpec.describe AccountCategory, type: :model do
      describe "associations" do
        it { is_expected.to belong_to :account_category }
      end
    end
  end
end
