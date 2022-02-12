class CreateMessageries < ActiveRecord::Migration[6.1]
  def change
    create_table :messageries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
