class Tag < ApplicationRecord
  
  has_many :event_tags, dependent: :destroy
  has_many :events, through: :event_tags


  def self.search_tag(word,search)
    if search == "タグ検索"
      Tag.where("tag_name LIKE?","%#{word}%")
    else
      Tag.all
    end
  end

end
