# frozen_string_literal: true

module Members
  module Onboarding
    class PersonalDetail
      include ActiveModel::Model

      attr_accessor :first_name, :middle_name, :last_name
    end
  end
end