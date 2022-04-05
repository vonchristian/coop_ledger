class CreateDebitAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :debit_amounts, id: :uuid do |t|
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid
      t.integer :amount_cents
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid
      t.date :recording_date, null: false
      t.column :recording_time, "timestamp with time zone", null: false

      t.timestamps
    end
  end
end
