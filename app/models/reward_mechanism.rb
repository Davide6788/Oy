class RewardMechanism < ApplicationRecord
  validates :counter, :discount, :minimum_purchase, presence: true
  has_many :businesses
end
