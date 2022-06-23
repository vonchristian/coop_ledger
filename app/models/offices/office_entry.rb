# frozen_string_literal: true

module Offices
  class OfficeEntry < ApplicationRecord
    belongs_to :office
    belongs_to :entry, class_name: "Accounting::Entry"
  end
end
