class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
