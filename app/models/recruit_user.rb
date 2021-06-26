class RecruitUser < ApplicationRecord

  belongs_to :user
  belongs_to :recruitement, optional: true
  has_one :instrument, through: :user

  validates :user_id, presence: true
  validates :recruitment_id, presence: true
  validates :recruit_comment, presence: true

  # enum join: {checking: 1, join: 2, refuse: 3 }


end
