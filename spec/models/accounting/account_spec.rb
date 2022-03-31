# frozen_string_literal: true

require "rails_helper"

module Accounting
  RSpec.describe Account, type: :model do
    describe "associations" do
      it { is_expected.to have_many :debit_amounts }
      it { is_expected.to have_many :credit_amounts }
    end
  end
end
