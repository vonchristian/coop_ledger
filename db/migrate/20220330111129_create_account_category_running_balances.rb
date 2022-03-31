class CreateAccountCategoryRunningBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :account_category_running_balances, id: :uuid do |t|
      t.belongs_to :account_category, null: false, foreign_key: true, type: :uuid
      t.date :recording_date
      t.time :recording_time
      t.integer :amount_cents

      t.timestamps
    end
  end
end
