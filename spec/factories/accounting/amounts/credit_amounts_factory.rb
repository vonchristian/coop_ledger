# frozen_string_literal: true

FactoryBot.define do
  factory :credit_amount, class: "Accounting::Amounts::CreditAmount" do
    association :entry
    amount_cents { 10_000 }
    association :account, factory: [:account, :expense]
    recording_date { Date.current }
    recording_time { Time.zone.now }
  end
end
