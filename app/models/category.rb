class Category < ApplicationRecord
  has_many :businesses
  has_one_attached :photo
end
