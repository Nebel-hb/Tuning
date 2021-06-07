class Recruitment < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :recruit_users, dependent: :destroy
  has_many :rooms
end
