# frozen_string_literal: true

module Cooperatives
  class MembershipCategory < ApplicationRecord
    belongs_to :cooperative
  end
end
