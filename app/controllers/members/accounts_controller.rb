# frozen_string_literal: true

module Members
  class AccountsController < ApplicationController
    def index
      @members = Person.all
    end
  end
end