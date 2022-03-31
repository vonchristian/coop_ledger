# frozen_string_literal: true

FactoryBot.define do
  factory :credit_amount, class: "Accounting::Amounts::CreditAmount" do
    association :entry
    amount_cents { 100 }
    association :account, factory: [:account, :asset]
  end
end
