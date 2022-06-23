class CreateEmployeeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_entries, id: :uuid do |t|
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid
      t.belongs_to :employee, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
