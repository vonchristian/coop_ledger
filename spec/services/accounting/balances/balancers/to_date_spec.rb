# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe ToDate do
        describe ".execute" do
          let!(:last_year_entry) do
            entry = build(:entry, recording_date: Date.current.last_year)
            entry.debit_amounts << create(:debit_amount, amount: 5_000)
            entry.credit_amounts << create(:credit_amount, amount: 5_000)
            entry.save
          end

          let!(:this_year_entry) do
            entry = build(:entry, recording_date: Date.current)
            entry.debit_amounts << create(:debit_amount, amount: 1_000)
            entry.credit_amounts << create(:credit_amount, amount: 1_000)
            entry.save
          end

          let!(:to_date)          { Date.current.last_year }
          let!(:result)           { described_class.new(
            amounts: Accounting::Amounts::DebitAmount.all,
            to_date: to_date)
          }

          it "computes based on date range passed" do
            expect(result.run).to eq 5_000
          end
        end
      end
    end
  end
end
