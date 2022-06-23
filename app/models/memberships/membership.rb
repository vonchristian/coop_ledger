# frozen_string_literal: true

module Memberships
  class Membership < ApplicationRecord
    belongs_to :member, class_name: "Person"
    belongs_to :cooperative
    belongs_to :membership_category, class_name: "Cooperatives::MembershipCategory"

    validates :application_date, presence: true
    validates :cooperative_id, uniqueness: { scope: :member_id }
    validates :membership_category_id, uniqueness: { scope: :member_id }
  end
end
