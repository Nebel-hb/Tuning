class EventTag < ApplicationRecord

  belongs_to :event, optional: true
  belongs_to :tag, optional: true

  validates :event_id, presence: true
  validates :tag_id, presence: true
end
