FactoryBot.define do
  factory :entry, class: "Accounting::Entry" do
    association :office
    recording_date   { Date.current }
    recording_time   { Time.zone.now }
    reference_number { "MyString" }
    description      { "MyText" }

    factory :entry_with_debit_and_credit, class: "Accounting::Entry" do
      after(:create) do |entry|
        entry.debit_amounts << create(:debit_amount,
          entry: entry,
          recording_date: entry.recording_date,
          recording_time: entry.recording_time)
        entry.credit_amounts << create(:credit_amount,
          entry: entry,
          recording_date: entry.recording_date,
          recording_time: entry.recording_time)
      end
    end
  end
end
