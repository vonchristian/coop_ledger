# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe Default do
        describe ".execute" do
          let!(:last_year_amount) { create(:debit_amount, recording_date: Date.current.last_year, amount: 5_000) }
          let!(:this_year_amount) { create(:debit_amount, recording_date: Date.current, amount: 1_000) }
          let!(:result)           { described_class.new(amounts: Accounting::Amounts::DebitAmount.all) }

          it "returns total of all amounts" do
            expect(result.run).to eq 6_000
          end
        end
      end
    end
  end
end
