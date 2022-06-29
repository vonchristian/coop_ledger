# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe DateTimeRange do
        describe ".execute" do
          let!(:last_year_entry) do # rubocop:disable RSpec/LetSetup
            entry = build(:entry, recording_date: Date.current, recording_time: Time.zone.now.beginning_of_day)
            entry.debit_amounts << create(:debit_amount, amount: 5_000)
            entry.credit_amounts << create(:credit_amount, amount: 5_000)
            entry.save
          end

          let!(:this_year_entry) do # rubocop:disable RSpec/LetSetup
            entry = build(:entry, recording_date: Date.current, recording_time: Time.zone.now.end_of_day - 2.hours)
            entry.debit_amounts << create(:debit_amount, amount: 1_000)
            entry.credit_amounts << create(:credit_amount, amount: 1_000)
            entry.save
          end

          let!(:result) do
            described_class.new(
              amounts:   Accounting::Amounts::DebitAmount.all,
              date_range: Date.current.all_year,
              time_range: Time.zone.now.beginning_of_day + 12.hours..Time.zone.now.end_of_day - 2.hours
            )
          end

          it "computes based on date range passed" do
            expect(result.run).to eq 1_000
          end
        end
      end
    end
  end
end
