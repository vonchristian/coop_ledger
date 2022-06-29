# frozen_string_literal: true

module Accounting
  class Account < ApplicationRecord
    extend Accounting::Balances::AggregatedAccount
    include Accounting::Balances::Individual
    include Accounting::RunningBalances::Individual
    include Accounting::NormalCreditBalance

    belongs_to :office
    belongs_to :account_category
    has_many :debit_amounts,    class_name: "Accounting::Amounts::DebitAmount", dependent: :restrict_with_exception
    has_many :credit_amounts,   class_name: "Accounting::Amounts::CreditAmount", dependent: :restrict_with_exception
    has_many :debit_entries,    class_name: "Accounting::Entry", through: :debit_amounts, source: :entry
    has_many :credit_entries,   class_name: "Accounting::Entry", through: :credit_amounts, source: :entry
    has_many :running_balances, class_name: "Accounting::RunningBalances::Account", dependent: :restrict_with_exception

    validates :name, :code, :account_type, presence: true
    validates :account_type, inclusion: Accounting::AccountType::ACCOUNT_TYPES

    scope :assets,      -> { where(account_type: Accounting::AccountType::ASSET) }
    scope :liabilities, -> { where(account_type: Accounting::AccountType::LIABILITY) }
    scope :equities,    -> { where(account_type: Accounting::AccountType::EQUITY) }
    scope :expenses,    -> { where(account_type: Accounting::AccountType::EXPENSE) }
    scope :revenues,    -> { where(account_type: Accounting::AccountType::REVENUE) }

    before_save do
      validate :same_type_with_account_category
    end

    def self.find_accounts(ids:)
      where(id: ids)
    end

    def entries
      Accounting::Entry.find_entries(ids: entry_ids)
    end

    def entry_ids
      [credit_entries.ids + debit_entries.ids].flatten.compact.uniq
    end

    def all_credit_amounts
      credit_amounts
    end

    def all_debit_amounts
      debit_amounts
    end

    private

    def same_type_with_account_category
      if account_category&.account_type != account_type
        errors.add(:account_type, "expecting '#{account_type}' but it was '#{account_category.account_type}'")
      end
    end
  end
end
