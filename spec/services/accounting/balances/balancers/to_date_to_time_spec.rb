# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe ToDateToTime do
        describe ".execute" do
          let(:to_date) { Date.current }
          let(:to_time) { Time.zone.now.beginning_of_day + 3.hours }

          let!(:result) do
            described_class.new(
              amounts: Accounting::Amounts::DebitAmount.all,
              to_date: to_date,
              to_time: to_time
            )
          end

          it "sets default value for from_date" do
            expect(result.from_date).to eq Date.current - Date.current.year.years
          end

          it "sets default value for from_time" do
            expect(result.from_time).to eq to_date.beginning_of_day.to_time
          end

          it "calls Accounting::Balances::Balancers::DateTimeRange service" do # rubocop:disable RSpec/ExampleLength
            expect(Accounting::Balances::Balancers::DateTimeRange).to have_received(:execute).with(
              amounts: result.amounts,
              from_date: result.from_date,
              to_date: to_date,
              from_time: result.from_time,
              to_time: to_time
            )

            result.run
          end
        end
      end
    end
  end
end
