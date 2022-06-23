class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries, id: :uuid do |t|
      t.text :description
      t.string :reference_number
      t.date :recording_date, null: false
      t.column :recording_time, "timestamp with time zone", null: false

      t.timestamps
    end
  end
end
