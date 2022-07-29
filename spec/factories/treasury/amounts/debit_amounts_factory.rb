FactoryBot.define do
  factory :voucher_debit_amount, class: "Treasury::Amounts::DebitAmount" do
    amount_cents { 10_000 }
    account { nil }
    voucher { nil }
  end
end
