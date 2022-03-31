# frozen_string_literal: true

FactoryBot.define do
  factory :entry, class: "Accounting::Entry" do
    description { "MyText" }
    reference_number { SecureRandom.hex(6) }
    association :office
    recording_date { Date.current }
    recording_time { Time.zone.now }
  end
end
