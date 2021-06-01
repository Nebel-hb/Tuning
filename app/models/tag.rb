class Tag < ApplicationRecord
  
  has_many :event_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :events, through: :event_tags
end
