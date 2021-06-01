class Recruitment < ApplicationRecord

  belongs_to :user
  belongs_to :area
  has_many :recruit_users, dependent: :destroy
end
