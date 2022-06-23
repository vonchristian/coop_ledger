FactoryBot.define do
  factory :cash_receipt_voucher do
    office { nil }
    employee { nil }
    reference_number { "MyString" }
    description { "MyText" }
  end
end
