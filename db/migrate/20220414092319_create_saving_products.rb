class CreateSavingProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :saving_products, id: :uuid do |t|
      t.belongs_to :cooperative, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :interest_earning, null: false, default: false
      t.decimal :interest_rate

      t.timestamps
    end
  end
end
