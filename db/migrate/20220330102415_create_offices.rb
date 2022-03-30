class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices, id: :uuid do |t|
      t.string :office_type, null: false
      t.string :name, null: false
      t.string :address
      t.string :contact_number
      t.belongs_to :cooperative, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :offices, :office_type
  end
end
