class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships, id: :uuid do |t|
      t.belongs_to :member, null: false, foreign_key: { to_table: :people }, type: :uuid
      t.belongs_to :cooperative, null: false, foreign_key: true, type: :uuid
      t.belongs_to :membership_category, null: false, foreign_key: true, type: :uuid
      t.date :approval_date
      t.date :application_date

      t.timestamps
    end
  end
end
