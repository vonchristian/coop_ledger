class CreatePersonalSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_savings, id: :uuid do |t|
      t.belongs_to :depositor, null: false, foreign_key: { to_table: :people }, type: :uuid
      t.belongs_to :saving_product, null: false, foreign_key: true, type: :uuid
      t.belongs_to :liability_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :interest_expense_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid
      t.date :opening_date
      t.date :closing_date

      t.timestamps
    end
  end
end
