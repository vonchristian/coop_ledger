# frozen_string_literal: true

module Accounting
  module Entries
    module Aggregates
      class OfficeEntry < ApplicationRecord
        self.table_name = "office_entries"

        belongs_to :office
        belongs_to :entry, class_name: "Accounting::Entry"

        validates :entry_id, uniqueness: { scope: :office_id }
      end
    end
  end
end
