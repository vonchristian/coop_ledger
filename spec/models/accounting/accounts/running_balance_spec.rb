# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Accounts
    RSpec.describe RunningBalance, type: :model do
      describe "associations" do
        it { is_expected.to belong_to :account }
      end
    end
  end
end
