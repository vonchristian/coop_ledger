FactoryBot.define do
  factory :membership_category, class: "Cooperatives::MembershipCategory" do
    association :cooperative
    title { "Regular Member" }
  end
end
