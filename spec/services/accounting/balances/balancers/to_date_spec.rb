# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe ToDate do
        describe ".execute" do
          let!(:last_year_amount) { create(:debit_amount, recording_date: Date.current.last_year, amount: 5_000) }
          let!(:this_year_amount) { create(:debit_amount, recording_date: Date.current, amount: 1_000) }
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
