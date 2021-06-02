class Chat < ApplicationRecord

  belongs_to :room
  belongs_to :user
  has_many :notifications, dependent: :destroy

end
