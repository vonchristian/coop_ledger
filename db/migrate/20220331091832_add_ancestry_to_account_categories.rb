class AddAncestryToAccountCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :account_categories, :ancestry, :string
    add_index :account_categories, :ancestry
  end
end
