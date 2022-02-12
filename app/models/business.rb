class Business < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_one :reward_mechanism
  belongs_to :category
  has_many :cards
  has_one_attached :photo
  has_many :posts

  validates :name, :address, :category, presence: true
end
