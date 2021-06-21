class Orchestra < ApplicationRecord

  belongs_to :user
  
  validates :user_id, presence: true
  validates :application_comment, presence: true

end
