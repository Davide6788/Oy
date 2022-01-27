class RewardMechanism < ApplicationRecord
  validates :counter, :discount, :minimal_purchase, presence: true
end
