class Room < ApplicationRecord
  has_many :chats, foreign_key: "user_id"
  has_many :user_rooms, foreign_key: "user_id", dependent: :destroy

  has_many :users, through: :chats
end
