FactoryBot.define do
  factory :saving, class: "Savings::Accounts::PersonalSaving" do
    association :member
    association :saving_product
    association :liability_account
    association :interest_expense_account, factory: :expense_account
    association :office
  end
end
