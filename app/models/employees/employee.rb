class Employee < ApplicationRecord
  has_secure_password

  belongs_to :office
end
