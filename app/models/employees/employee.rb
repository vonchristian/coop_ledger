# frozen_string_literal: true

module Employees
  class Employee < ApplicationRecord
    has_secure_password

    belongs_to :office
    belongs_to :person
  end
end
