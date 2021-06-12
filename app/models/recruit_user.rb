class RecruitUser < ApplicationRecord

  belongs_to :user
  belongs_to :recruitement, optional: true

  # enum join: {checking: 1, join: 2, refuse: 3 }

end
