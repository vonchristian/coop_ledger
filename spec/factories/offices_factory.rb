FactoryBot.define do
  factory :office do
    office_type { "main_office" }
    name { Faker::Company.name }
    address { "MyString" }
    contact_number { "MyString" }
    association :cooperative

    trait :main_office do
      office_type { "main_office" }
    end
  end
end
