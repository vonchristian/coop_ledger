# frozen_string_literal: true

module Memberships
  class MembershipCategory < ApplicationRecord
    belongs_to :cooperative
  end
end
