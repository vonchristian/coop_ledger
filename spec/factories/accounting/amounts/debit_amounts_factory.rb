# frozen_string_literal: true

FactoryBot.define do
  factory :debit_amount, class: "Accounting::Amounts::DebitAmount" do
    association :entry
    amount_cents { 100 }
    association :account, factory: [:account, :asset]
  end
end
