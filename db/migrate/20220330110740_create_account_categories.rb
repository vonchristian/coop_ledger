class CreateAccountCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :account_categories, id: :uuid do |t|
      t.string :account_type, null: false
      t.string :code, null: false
      t.boolean :contra, default: true
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :account_categories, :account_type
  end
end
