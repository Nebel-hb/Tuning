class Instrument < ApplicationRecord

  has_many :users
  has_many :recruitments

  def self.search_instrument(event_params,search)
    if search == "楽器"
        @events = event

     
 

    end
  end
end
