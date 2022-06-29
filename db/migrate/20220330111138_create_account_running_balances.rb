class CreateAccountRunningBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :account_running_balances, id: :uuid do |t|
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid
      t.belongs_to :entry, foreign_key: true, type: :uuid
      t.date :recording_date
      t.time :recording_time
      t.integer :amount_cents

      t.timestamps
    end

    add_index :account_running_balances, [:account_id, :entry_id], unique: true
    add_index :account_running_balances, :recording_date
    add_index :account_running_balances, :recording_time
  end
end
