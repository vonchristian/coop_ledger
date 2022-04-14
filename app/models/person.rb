# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :memberships, class_name: "Members::Membership", dependent: :restrict_with_exception
end
