class Post < ApplicationRecord
  belongs_to :business
  has_one_attached :photo
end
