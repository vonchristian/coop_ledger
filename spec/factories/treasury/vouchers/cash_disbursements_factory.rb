FactoryBot.define do
  factory :cash_disbursement_voucher, class: "Treasury::Vouchers::CashDisbursement" do
    association :office
    reference_number { SecureRandom.uuid }
    description { Faker::Commerce.product_name }
    recording_date { Date.current }
    recording_time {  }
    employee { nil }
  end
end
