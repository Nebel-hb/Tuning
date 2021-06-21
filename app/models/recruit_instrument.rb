class RecruitInstrument < ApplicationRecord

  belongs_to :recruitment,  optional: true
  belongs_to :instrument

  validates :instrument_id, presence: true
  validates :recruitment_id, presence: true
  validates :need_people, presence: true

end
