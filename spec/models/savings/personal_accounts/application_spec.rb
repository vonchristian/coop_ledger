require 'rails_helper'

module Savings
  module PersonalAccounts
    RSpec.describe Application, type: :model do
      describe "associations" do
        it { is_expected.to belong_to :depositor }
        it { is_expected.to belong_to :saving_product }
        it { is_expected.to belong_to :liability_account }
        it { is_expected.to belong_to :interest_account }
        it { is_expected.to belong_to :office }
      end
    end
  end
end
