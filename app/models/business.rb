class Business < ApplicationRecord
  belongs_to :user
  belongs_to :reward_mechanism
  belongs_to :category
  has_many :cards

  validates :name, :address, :category, presence: true
end
