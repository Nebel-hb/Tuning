class ThankYouComment < ApplicationRecord

   belongs_to :user, optional: true
   belongs_to :recruitement, optional: true

   validates :user_id, presence: true
   validates :thanks_comment, presence: true

   def percentage
      self * 50 + 50

   end

end
