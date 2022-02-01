class RewardMechanism < ApplicationRecord
  validates :counter, :discount, :minimum_purchase, presence: true
  belongs_to :business
end
