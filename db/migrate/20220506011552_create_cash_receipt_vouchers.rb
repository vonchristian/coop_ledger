class CreateCashReceiptVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_receipt_vouchers, id: :uuid do |t|
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid
      t.belongs_to :employee, null: false, foreign_key: true, type: :uuid
      t.string :reference_number, null: false
      t.text :description, null: false
      t.date :recording_date, null: false
      t.column :recording_time, "timestamp with time zone", null: false

      t.timestamps
    end
    add_index :cash_receipt_vouchers, :reference_number
  end
end
