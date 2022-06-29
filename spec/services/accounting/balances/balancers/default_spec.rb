# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe Default do
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

          let!(:result)           { described_class.new(amounts: Accounting::Amounts::DebitAmount.all) }

          it "returns total of all amounts" do
            expect(result.run).to eq 6_000
          end
        end
      end
    end
  end
end
