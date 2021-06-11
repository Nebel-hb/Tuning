class ThankYouComment < ApplicationRecord
  
   belongs_to :user, optional: true
   belongs_to :recruitement, optional: true
end
