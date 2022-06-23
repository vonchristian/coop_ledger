class EmployeeEntry < ApplicationRecord
  belongs_to :entry
  belongs_to :employee
end
