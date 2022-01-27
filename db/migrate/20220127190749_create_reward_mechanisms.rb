class CreateRewardMechanisms < ActiveRecord::Migration[6.1]
  def change
    create_table :reward_mechanisms do |t|
      t.integer :counter
      t.string :discount
      t.integer :minimum_purchase

      t.timestamps
    end
  end
end
