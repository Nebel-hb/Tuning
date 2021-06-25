class RecruitInstrument < ApplicationRecord

  belongs_to :recruit_relation,  optional: true
  belongs_to :instrument

  validates :instrument_id, presence: true
  validates :recruit_relation_id, presence: true
  validates :need_people, presence: true, numericality: {only_integer: true}

  # def check_find_all
  #   self.each do |i|
  #     if i.need_people == i.finded_people
  #       i.find_all == true
  #     end
  #   end
  # end

end
