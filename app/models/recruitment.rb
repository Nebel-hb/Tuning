class Recruitment < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  belongs_to :instrument, optional: true
  has_many :thank_you_comments, dependent: :destroy
  has_many :recruit_users, dependent: :destroy
  has_many :rooms


  def self.search_recruit(word)
    @recruitments = Recruitment.where("title LIKE?","%#{word}%")
  end




end