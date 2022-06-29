# frozen_string_literal: true

module Personal
  class Person < ApplicationRecord
    has_many :memberships, class_name: "Memberships::Membership", dependent: :restrict_with_exception
  end
end
