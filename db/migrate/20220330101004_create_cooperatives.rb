class CreateCooperatives < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperatives, id: :uuid do |t|
      t.string :name, null: false
      t.string :abbreviated_name, null: false
      t.string :registration_number
      t.string :contact_number
      t.string :address

      t.timestamps
    end
  end
end
