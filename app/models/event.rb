class Event < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :comments, dependent: :destroy

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_event_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_event_tag

    end
  end


  def self.search_event(event_params,search,event)
    if search == "イベント検索"
        @events = event

      unless event_params[0].empty?
        @events = @events.where("title LIKE?","%#{event_params[0]}%" )
        # unless event_params[1].empty?
          # @events = @events.where(area_id: event_params[1])
        # @events = Event.all
        # # event_start = Event.where("start > ?", event_params[2]).reorder(:start)
        # # event_end = Event.where("end < ?",event_params[3]).reorder(:end)
        # end
        # end
      end
    else
      @events = Event.all
    end
  end

  def self.sort(not_sort)
    case not_sort
    when '開始日時順'
      return all.order(start: :DESC)
    when '終了日時順'
      return all.order(end: :ASC)

    end
  end

end
