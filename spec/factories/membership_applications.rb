FactoryBot.define do
  factory :membership_application do
    membership_category { nil }
    cooperative { nil }
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    date_of_birth_day { 1 }
    date_of_birth_month { 1 }
    date_of_birth_year { 1 }
    email { "MyString" }
    phone_number { "MyString" }
    civil_status { "MyString" }
    sex { "MyString" }
  end
end
