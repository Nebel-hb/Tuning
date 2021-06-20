class Instrument < ApplicationRecord

  has_many :users
  has_many :recruitments
  has_many :recruit_instruments

  validates :instrument_name, presence: true

end
