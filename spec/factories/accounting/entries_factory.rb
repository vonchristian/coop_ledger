FactoryBot.define do
  factory :entry, class: "Accounting::Entry" do
    recording_date   { Date.current }
    recording_time   { Time.zone.now }
    reference_number { "MyString" }
    description      { "MyText" }

    factory :entry_with_debit_and_credit, class: "Accounting::Entry" do
      after(:build) do |entry|
        entry.debit_amounts << create(:debit_amount)
        entry.credit_amounts << create(:credit_amount)
      end
    end
  end
end
