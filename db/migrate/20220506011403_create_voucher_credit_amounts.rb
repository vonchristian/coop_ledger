class CreateVoucherCreditAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :voucher_credit_amounts, id: :uuid do |t|
      t.integer :amount_cents, limit: 8, null: false
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid
      t.belongs_to :voucher, null: false, type: :uuid

      t.timestamps
    end
  end
end
