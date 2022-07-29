# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe DateRange do
        describe ".execute" do
          let!(:entry1) { create(:entry_with_debit_and_credit, recording_date: Date.current.last_year) }
          let!(:entry2) { create(:entry_with_debit_and_credit, recording_date: Date.current) }
          let!(:result1) { described_class.new(
            amounts: Accounting::Amounts::DebitAmount.all,
            date_range: Date.current.beginning_of_year..Date.current.end_of_year)
          }

          let!(:result2) { described_class.new(
            amounts: Accounting::Amounts::DebitAmount.all,
            date_range: Date.current.last_year..Date.current.end_of_year)
          }

          it "computes based on date range passed" do
            expect(result2.run.to_f).to eq 2_000
          end
        end
      end
    end
  end
end
