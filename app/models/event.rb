class Event < ApplicationRecord

  belongs_to :user
  belongs_to :area
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :comments, dependent: :destroy



end
