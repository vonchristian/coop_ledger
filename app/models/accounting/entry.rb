# frozen_string_literal: true

module Accounting
  class Entry < ApplicationRecord
    belongs_to :running_balance, class_name: "Accounting::Accounts::RunningBalance", optional: true
    has_many :debit_amounts,     class_name: 'Accounting::Amounts::DebitAmount'
    has_many :credit_amounts,    class_name: 'Accounting::Amounts::CreditAmount'
    has_many :debit_accounts,    through: :debit_amounts, class_name: "Accounting::Account", source: :account
    has_many :credit_accounts,   through: :credit_amounts, class_name: "Accounting::Account", source: :account

    validates :recording_date, :recording_time, :reference_number, :description, presence: true
    validate :has_credit_amounts?
    validate :has_debit_amounts?
    validate :amounts_cancel?

    def self.find_entries(ids:)
      where(id: ids)
    end

    def self.order_by_latest
      order(recording_date: :desc)
      .order(recording_time: :desc)
    end

    def accounts
      Accounting::Account.find_accounts(ids: account_ids)
    end

    def account_ids
      [debit_accounts.ids + credit_accounts.ids].flatten.compact.uniq
    end

    private

    def has_credit_amounts?
      errors[:base] << "Entry must have at least one credit amount" if credit_amounts.blank?
    end

    def has_debit_amounts?
      errors[:base] << "Entry must have at least one debit amount" if debit_amounts.blank?
    end

    def amounts_cancel?
      return errors[:base] << "The credit and debit amounts are not equal" if credit_amounts.balance_for_new_record != debit_amounts.balance_for_new_record
      return errors[:base] << "The credit and debit amounts are not equal" if credit_amounts.total != debit_amounts.total
    end
  end
end
