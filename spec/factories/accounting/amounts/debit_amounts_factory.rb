# frozen_string_literal: true

FactoryBot.define do
  factory :debit_amount, class: "Accounting::Amounts::DebitAmount" do
    association :entry
    amount_cents { 10_0000 }
    association :account, factory: [:account, :asset]
  end
end
