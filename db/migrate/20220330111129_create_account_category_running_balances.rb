class CreateAccountCategoryRunningBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :account_category_running_balances, id: :uuid do |t|
      t.belongs_to :account_category, null: false, foreign_key: true, type: :uuid
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid
      t.date :recording_date, null: false
      t.column :recording_time, "timestamp with time zone", null: false
      t.integer :amount_cents, limit: 8, null: false

      t.timestamps
    end

    add_index :account_category_running_balances, [:account_category_id, :entry_id], unique: true, name: "index_account_catrunning_bals_on_account_cat_id_and_entry_id"
  end
end
