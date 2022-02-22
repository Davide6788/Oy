class Messageroom < ApplicationRecord
  belongs_to :user
  belongs_to :business
  has_many :messages, dependent: :destroy
end
