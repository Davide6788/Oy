class Message < ApplicationRecord
  belongs_to :messagerie
  belongs_to :user
end
