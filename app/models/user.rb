class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { general: 1, orchestra: 2 }#cancancan

  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :user_rooms
  has_many :chats
  has_many :rooms
  has_many :orchestras
  has_many :recruit_users
  has_many :recruitments
  belongs_to :instrument, optional: true
  belongs_to :area, optional: true

  def create_notification_join!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'join'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'join'
      )
      notification.save if notification.valid?
    end
  end
  
  def create_notification_add_room!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'add_room'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'add_room'
      )
      notification.save if notification.valid?
    end
  end

end
