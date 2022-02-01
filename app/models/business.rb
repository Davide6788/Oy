class Business < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  belongs_to :reward_mechanism
  belongs_to :category
  has_many :cards
  has_one_attached :photo

  validates :name, :address, :category, presence: true
end
