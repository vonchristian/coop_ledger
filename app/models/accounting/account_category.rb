# frozen_string_literal: true

module Accounting
  class AccountCategory < ApplicationRecord
    extend Accounting::Balances::AggregatedAccountCategory

    include Accounting::Balances::Individual
    include Accounting::RunningBalances::Individual
    include Accounting::NormalCreditBalance

    has_ancestry(primary_key_format: /\A[\w\-]+(\/[\w\-]+)*\z/)

    scope :assets,      -> { where(account_type: Accounting::AccountType::ASSET) }
    scope :liabilities, -> { where(account_type: Accounting::AccountType::LIABILITY) }
    scope :equities,    -> { where(account_type: Accounting::AccountType::EQUITY) }
    scope :expenses,    -> { where(account_type: Accounting::AccountType::EXPENSE) }
    scope :revenues,    -> { where(account_type: Accounting::AccountType::REVENUE) }

    belongs_to :office
    has_many :accounts,         class_name: 'Accounting::Account'
    has_many :debit_amounts,    class_name: 'Accounting::Amounts::DebitAmount',  through: :accounts
    has_many :credit_amounts,   class_name: 'Accounting::Amounts::CreditAmount',  through: :accounts
    has_many :running_balances, class_name: "Accounting::RunningBalances::AccountCategory"
    has_many :sub_categories,   class_name: "Accounting::AccountCategory", foreign_key: "ancestry"
    validates :name, :account_type, presence: true

    def self.no_sub_categories
      where(ancestry: nil)
    end

    def all_credit_amounts
      return credit_amounts if subtree.one?

      Accounting::Amounts::CreditAmount.where(account_id: all_accounts.ids)
    end

    def all_debit_amounts
      return debit_amounts if subtree.one?

      Accounting::Amounts::DebitAmount.where(account_id: all_accounts.ids)
    end

    def tabs_count
      ancestry.to_s.split("/").size.to_i
    end

    def all_accounts
      return accounts if subtree.one?

      ids = subtree.includes(:accounts).map{ |sub| sub.accounts.ids }.compact.flatten.uniq
      Accounting::Account.where(id: ids)
    end
  end
end
