class RemoveCategoryFromBusinesses < ActiveRecord::Migration[6.1]
  def change
    remove_column :businesses, :category, :string
  end
end
