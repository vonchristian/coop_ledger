# frozen_string_literal: true

require "rails_helper"

module Accounting
  module Balances
    module Balancers
      describe FindBalancer do
        describe "execute" do
          it "when args is empty" do
            result = described_class.new

            expect(result.run).to eql Accounting::Balances::Balancers::Default
          end

          it "when args is to_date" do
            result = described_class.new(to_date: Date.current)

            expect(result.run).to eql Accounting::Balances::Balancers::ToDate
          end

          it "when args is from_date_to_date" do
            result = described_class.new(from_date: Date.current.last_year, to_date: Date.current)

            expect(result.run).to eql Accounting::Balances::Balancers::DateRange
          end

          it "when args is from_date_from_time_to_date_to_time" do # rubocop:disable RSpec/ExampleLength
            result = described_class.new(
              from_date: Date.current.last_year,
              from_time: Time.zone.now,
              to_date: Date.current,
              to_time: Time.zone.now
            )

            expect(result.run).to eql Accounting::Balances::Balancers::DateTimeRange
          end

          it "when args is to_date_to_time" do
            result = described_class.new(to_date: Date.current, to_time: Time.zone.now)

            expect(result.run).to eql Accounting::Balances::Balancers::ToDateToTime
          end

          it "when args is invalid" do
            result = described_class.new(date: Date.current, time: Time.zone.now)

            expect { result.run }.to raise_error(
              StandardError,
              "Invalid arguments. Must be #{described_class::BALANCE_CLASSES.keys}"
            )
          end
        end
      end
    end
  end
end
