# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password              { "Simple123" }
    password_confirmation { "Simple123" }
    association           :office
  end
end
