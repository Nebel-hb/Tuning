class Room < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :recruitment, optional: true
  has_many :chats
  has_many :user_rooms
  has_many :notifications, dependent: :destroy


end
