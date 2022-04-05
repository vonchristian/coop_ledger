# frozen_string_literal: true

FactoryBot.define do
  factory :account, class: "Accounting::Account" do
    name         { Faker::Commerce.product_name }
    account_type { Accounting::AccountType::ASSET }
    code        { SecureRandom.hex(8) }
    contra      { false }
    association :office
    association :account_category, factory: [:account_category, :asset]

    trait :asset do
      account_type { Accounting::AccountType::ASSET }
      association :account_category, factory: [:account_category, :asset]
    end

    trait :liability do
      account_type { Accounting::AccountType::LIABILITY }
      association :account_category, factory: [:account_category, :liability]
    end

    trait :equity do
      account_type { Accounting::AccountType::EQUITY }
      association :account_category, factory: [:account_category, :equity]
    end

    trait :revenue do
      account_type { Accounting::AccountType::REVENUE }
      association :account_category, factory: [:account_category, :revenue]
    end

    trait :expense do
      account_type { Accounting::AccountType::EXPENSE }
      association :account_category, factory: [:account_category, :expense]
    end
  end
end
