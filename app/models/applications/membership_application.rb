# frozen_string_literal: true

module Applications
  class MembershipApplication < ApplicationRecord
    has_secure_token :reference_number

    belongs_to :membership_category
    belongs_to :cooperative
  end
end
