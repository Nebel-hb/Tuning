class RecruitInstrument < ApplicationRecord

  belongs_to :recruitment,  optional: true
  belongs_to :instrument
  
end
