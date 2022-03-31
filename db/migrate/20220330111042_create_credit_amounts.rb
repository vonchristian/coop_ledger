class CreateCreditAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_amounts, id: :uuid do |t|
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid
      t.integer :amount_cents
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
