class CreateMembershipCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_categories, id: :uuid do |t|
      t.belongs_to :cooperative, null: false, foreign_key: true, type: :uuid
      t.string :title, null: false

      t.timestamps
    end
  end
end
