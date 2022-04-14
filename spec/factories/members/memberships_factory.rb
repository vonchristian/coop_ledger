FactoryBot.define do
  factory :membership, class: "Members::Membership" do
    association :member
    association :cooperative
    association :membership_category
    approval_date { "2022-04-07" }
    application_date { "2022-04-07" }
  end
end
