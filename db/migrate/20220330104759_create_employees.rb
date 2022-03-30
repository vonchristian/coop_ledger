class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :employees, :email, unique: true
  end
end
