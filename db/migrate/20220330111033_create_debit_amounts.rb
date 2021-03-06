class CreateDebitAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :debit_amounts, id: :uuid do |t|
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid
      t.integer :amount_cents, limit: 8, null: false
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
