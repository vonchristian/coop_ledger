# frozen_string_literal: true

FactoryBot.define do
  factory :account_category, class: "Accounting::AccountCategory" do
    name         { Faker::Commerce.product_name }
    account_type { Accounting::AccountType::ASSET }
    code { SecureRandom.hex(8) }
    contra { false }
    association :office

    trait :asset do
      account_type { Accounting::AccountType::ASSET }
    end

    trait :liability do
      account_type { Accounting::AccountType::LIABILITY }
    end

    trait :equity do
      account_type { Accounting::AccountType::EQUITY }
    end

    trait :revenue do
      account_type { Accounting::AccountType::REVENUE }
    end

    trait :expense do
      account_type { Accounting::AccountType::EXPENSE }
    end
  end
end
