class RecruitRelation < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :recruitment, optional: true
  belongs_to :event, optional: true
  has_many :recruit_instruments, dependent: :destroy
end
