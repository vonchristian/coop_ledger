class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries, id: :uuid do |t|
      t.text :description
      t.string :reference_number
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid
      t.date :recording_date
      t.time :recording_time

      t.timestamps
    end
  end
end
