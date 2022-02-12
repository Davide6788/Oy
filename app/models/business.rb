class Business < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_one :reward_mechanism
  belongs_to :category
  has_many :cards, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :messageries

  validates :name, :address, :category, presence: true
end
