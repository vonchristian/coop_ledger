class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.integer :date_of_birth_day, null: false
      t.integer :date_of_birth_month, null: false
      t.integer :date_of_birth_year, null: false
      t.string :email
      t.string :phone_number
      t.string :civil_status, null: false
      t.string :sex, null: false

      t.timestamps
    end
    add_index :people, :email, unique: true
    add_index :people, :civil_status
    add_index :people, :sex
  end
end
