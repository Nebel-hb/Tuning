class Event < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :comments, dependent: :destroy
  has_many :recruit_relations, dependent: :destroy
  attachment :event_image

  validates :user_id, presence: true
  validates :area_id, presence: true
  validates :title, presence: true
  validates :event_introduction, presence: true
  validates :start, presence: true
  validates :end, presence: true
  if :start == blank? && :end == blank?
    validate :start_end_check
    validate :start_check

    def start_end_check
      errors.add(:end, "は開始時刻より遅い時間を選択してください") if self.start > self.end
    end

    def start_check
      errors.add(:start, "は現在の日時より遅い時間を選択してください") if self.start < Time.now
    end
  end


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

  def self.search_time(q, time)
    if  time == "開催予定のイベント"
      q.where("events.end > ?", DateTime.now).endtime
    elsif time == "過去のイベント"
      q.where("events.end < ?", DateTime.now).endtime
    else
      q
    end
  end

  scope :endtime, -> { reorder(:end) }

end
