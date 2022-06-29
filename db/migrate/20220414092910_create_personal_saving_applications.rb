class CreatePersonalSavingApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_saving_applications, id: :uuid do |t|
      t.belongs_to :depositor, null: false, foreign_key: { to_table: :people }, type: :uuid
      t.belongs_to :saving_product, null: false, foreign_key: true, type: :uuid
      t.belongs_to :liability_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :interest_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :office, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
