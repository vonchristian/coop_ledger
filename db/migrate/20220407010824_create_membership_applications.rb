class CreateMembershipApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_applications, id: :uuid do |t|
      t.belongs_to :membership_category, null: false, foreign_key: true, type: :uuid
      t.belongs_to :cooperative, null: false, foreign_key: true, type: :uuid
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
      t.string :reference_number, null: false

      t.timestamps
    end
    add_index :membership_applications, :email, unique: true
    add_index :membership_applications, :civil_status
    add_index :membership_applications, :sex
    add_index :membership_applications, :reference_number, unique: true
  end
end
