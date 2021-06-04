class RecruitUser < ApplicationRecord

  belongs_to :user
  belongs_to :recruitement, optional: true

end
