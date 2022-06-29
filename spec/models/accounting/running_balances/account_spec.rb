# frozen_string_literal: true

require "rails_helper"

module Accounting
  module RunningBalances
    RSpec.describe Account, type: :model do
      describe 'monetize' do
        it { is_expected.to monetize(:amount) }
      end

      describe "associations" do
        it { is_expected.to belong_to :account }
        it { is_expected.to belong_to :entry }
      end

      describe 'validations' do
        it { is_expected.to validate_presence_of :amount_cents }
        it { is_expected.to validate_numericality_of :amount_cents }

        it 'validate uniqueness of entry_id scoped to account_id' do
          entry = create(:entry_with_debit_and_credit)
          account = create(:account, :asset)
          create(:account_running_balance, entry: entry, account: account)
          record = build(:account_running_balance, entry: entry, account: account)
          record.save

          expect(record.errors[:entry_id]).to include("has already been taken")
        end
      end

      describe '.latest' do
        let!(:latest_record) { create(:account_running_balance, recording_date: Date.current, recording_time: Time.zone.now) }
        let!(:old_record) { create(:account_running_balance, recording_date: Date.current, recording_time: Time.zone.now - 1.minute) }

        it { expect(described_class.latest).to eq latest_record }
        it { expect(described_class.latest).not_to eq old_record }
      end
    end
  end
end
