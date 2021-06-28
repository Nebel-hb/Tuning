class RecruitInstrument < ApplicationRecord

  belongs_to :recruit_relation,  optional: true
  belongs_to :instrument

  validates :instrument_id, presence: true
  validates :recruit_relation_id, presence: true
  validates :need_people, presence: true, numericality: {only_integer: true}

end
