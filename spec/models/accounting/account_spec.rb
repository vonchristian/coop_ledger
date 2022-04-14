# frozen_string_literal: true

require "rails_helper"

module Accounting
  RSpec.describe Account, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :office }
      it { is_expected.to belong_to :account_category }
      it { is_expected.to have_many(:debit_amounts).dependent(:restrict_with_exception) }
      it { is_expected.to have_many(:credit_amounts).dependent(:restrict_with_exception) }
      it { is_expected.to have_many :debit_entries }
      it { is_expected.to have_many :credit_entries }
      it { is_expected.to have_many(:running_balances).dependent(:restrict_with_exception) }
    end

    describe ".balance" do
      let(:asset)        { create(:account, :asset, contra: false) }
      let(:contra_asset) { create(:account, :asset, contra: true) }
      let(:expense)      { create(:account, :expense, contra: false) }

      it "adds account balance if not a contra account" do
        entry = build(:entry)
        entry.debit_amounts << build(:debit_amount, account: asset, amount: 10_000)
        entry.credit_amounts << build(:credit_amount, account: expense, amount: 10_000)
        entry.save!

        expect(described_class.assets.balance).to eql 10_000.0
      end

      it "subtracts account balance if contra account" do
        entry = build(:entry)
        entry.debit_amounts << build(:debit_amount, account: contra_asset, amount: 5_000)
        entry.credit_amounts << build(:credit_amount, account: expense, amount: 5_000)
        entry.save!

        expect(described_class.assets.balance).to eql 5_000.0
      end
    end


  end
end
