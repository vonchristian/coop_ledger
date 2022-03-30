# frozen_string_literal: true

FactoryBot.define do
  factory :cooperative do
    name { Faker::Company.name }
    abbreviated_name { "MyString" }
    registration_number { "MyString" }
    contact_number { "MyString" }
    address { "MyString" }
  end
end
