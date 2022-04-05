# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe DateRange do
        describe ".execute" do
          let!(:last_year_amount) { create(:debit_amount, recording_date: Date.current.last_year, amount: 5_000) }
          let!(:this_year_amount) { create(:debit_amount, recording_date: Date.current, amount: 1_000) }
          let!(:from_date)        { Date.current.beginning_of_year }
          let!(:to_date)          { Date.current.end_of_year }
          let!(:result)           { described_class.new(
            amounts: Accounting::Amounts::DebitAmount.all,
            from_date: from_date,
            to_date: to_date)
          }

          it "computes based on date range passed" do
            expect(result.run).to eq 1_000
          end
        end
      end
    end
  end
end
