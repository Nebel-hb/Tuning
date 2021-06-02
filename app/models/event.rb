class Event < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :comments, dependent: :destroy



end
