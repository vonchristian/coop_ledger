FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    office { nil }
  end
end
