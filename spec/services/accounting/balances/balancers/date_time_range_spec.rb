# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe DateTimeRange do
        describe ".execute" do
          let!(:amount1) { create(:debit_amount, recording_date: Date.current, amount: 5_000, recording_time: Time.zone.now.beginning_of_day + 2.hours ) }
          let!(:amount2) { create(:debit_amount, recording_date: Date.current, amount: 1_000, recording_time: Time.zone.now.end_of_day - 2.hours ) }
          let(:from_date)        { Date.current.beginning_of_year }
          let(:to_date)          { Date.current.end_of_year }
          let(:from_time)        { Time.zone.now.beginning_of_day + 12.hours }
          let(:to_time)          {Time.zone.now.end_of_day - 2.hours }

          let!(:result)           { described_class.new(
            amounts: Accounting::Amounts::DebitAmount.all,
            from_date: from_date,
            to_date: to_date,
            from_time: from_time,
            to_time: to_time,
          )
          }

          it "computes based on date range passed" do
            expect(result.run).to eq 1_000
          end
        end
      end
    end
  end
end
