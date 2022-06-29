# frozen_string_literal: true
module Employees
  class EmployeeEntry < ApplicationRecord
    belongs_to :entry
    belongs_to :employee
  end
end
