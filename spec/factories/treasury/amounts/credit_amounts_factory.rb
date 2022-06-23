FactoryBot.define do
  factory :voucher_credit_amount, class: "Treasury::Amounts::CreditAMount" do
    amount_cents { 1 }
    account { nil }
    voucher { nil }
  end
end
