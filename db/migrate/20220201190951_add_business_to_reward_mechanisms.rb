class AddBusinessToRewardMechanisms < ActiveRecord::Migration[6.1]
  def change
    add_reference :reward_mechanisms, :business, null: false, foreign_key: true
  end
end
