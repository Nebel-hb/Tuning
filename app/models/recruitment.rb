class Recruitment < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :recruit_instruments, dependent: :destroy
  has_many :instruments, through: :recruit_instruments
  has_many :thank_you_comments, dependent: :destroy
  has_many :recruit_users, dependent: :destroy
  has_many :rooms


  # validate :start_end_check
  # validate :start_check

  # def start_end_check
  #   errors.add(:recruit_end, "は開始時刻より遅い時間を選択してください") if self.recruit_start > self.recruit_end
  #   errors.add(:recruit_event_end, "は開始時刻より遅い時間を選択してください") if self.recruit_event_start > self.recruit_event_end
  # end

  # def start_check
  #   errors.add(:recruit_start, "は現在の日時より遅い時間を選択してください") if self.recruit_start < Time.now
  #   errors.add(:recruit_event_start, "は募集開始の日時より遅い時間を選択してください") if self.recruit_event_start < self.recruit_start
  # end



  # def self.search_recruit(word)
  #   @recruitments = Recruitment.where("title LIKE?","%#{word}%")
  # end




end