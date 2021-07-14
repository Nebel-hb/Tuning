class Chat < ApplicationRecord

  belongs_to :room
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :message, presence: true

  # after_create_commit { ChatBroadcastJob.perform_later self }


end
