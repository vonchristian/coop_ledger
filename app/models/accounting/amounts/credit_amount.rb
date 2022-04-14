# frozen_string_literal: true

module Accounting
  module Amounts
    class CreditAmount < ApplicationRecord
      extend Accounting::Balances::Balance
      monetize :amount_cents, as: :amount
      belongs_to :entry
      belongs_to :account

      validates :recording_date, :recording_time, presence: true
      validates :amount_cents, numericality: { greater_than: 0.0 }

      before_save do
        validate :recording_date_is_same_with_entry?
        validate :recording_time_is_same_with_entry?
        set_recording_date
        set_recording_time
      end

      private

      def recording_date_is_same_with_entry?
        if recording_date != entry.recording_date
          errors[:recording_date] << "Recording date must be same with entry recording date"
        end
      end

      def recording_time_is_same_with_entry?
        if recording_time != entry.recording_time
          errors[:recording_time] << "Recording time must be same with entry recording time"
        end
      end

      def set_recording_date
        self.recording_date = entry.recording_date
      end

      def set_recording_time
        self.recording_time = entry.recording_time
      end
    end
  end
end
