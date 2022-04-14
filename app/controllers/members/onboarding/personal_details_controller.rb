# frozen_string_literal: true

module Members
  module Onboarding
    class PersonalDetailsController < ApplicationController
      def new
        @personal_detail = Members::Onboarding::PersonalDetail.new
      end
    end
  end
end
