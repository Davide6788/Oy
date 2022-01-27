class Business < ApplicationRecord
  belongs_to :user
  belongs_to :reward_mechanism

  validates :name, :address, :category, presence: true
end
