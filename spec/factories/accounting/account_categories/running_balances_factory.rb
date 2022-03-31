# frozen_string_literal: true

FactoryBot.define do
  factory :account_category_running_balance, class: "Accounting::AccountCategories::RunningBalance" do
    association :account_category, factory: [:account_category, :asset]
    recording_date { Date.current }
    recording_time { Time.zone.now }
    amount_cents   { 10_000 }
  end
end
