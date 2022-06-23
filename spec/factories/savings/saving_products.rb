FactoryBot.define do
  factory :saving_product do
    cooperative { nil }
    name { "MyString" }
    description { "MyString" }
    interest_earning { false }
    interest_rate { "9.99" }
  end
end
