class Card < ApplicationRecord
  belongs_to :user
  belongs_to :business

  validates :points, presence: true
end
