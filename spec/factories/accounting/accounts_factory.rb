# frozen_string_literal: true

FactoryBot.define do
  factory :account, class: "Accounting::Account" do
    account_type { Accounting::AccountType::ASSET }
    code        { SecureRandom.hex(8) }
    contra      { false }
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
