# frozen_string_literal: true

FactoryBot.define do
  factory :account_running_balance, class: "Accounting::Accounts::RunningBalance" do
    association :account
    recording_date { Date.current }
    recording_time { Time.zone.now }
    amount_cents { 10_000 }
  end
end
