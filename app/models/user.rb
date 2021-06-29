class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  enum role: { general: 1, orchestra: 2 }#cancancan

  has_many :comments, dependent: :destroy
  has_many :thank_you_comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :user_rooms
  has_many :chats
  has_many :rooms
  has_many :orchestras
  has_many :recruit_users
  has_many :recruitments
  has_many :recruit_relations, dependent: :destroy
  belongs_to :instrument, optional: true
  belongs_to :area, optional: true


  validates :name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #　←メールアドレスの正規表現
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  #メールアドレスを正規表現のフォームに指定
  validates :area_id,  presence: true
  validates :instrument_id,  presence: true
  # before_save :downcase_email

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
  def create_notification_thanks!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'thanks'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'thanks'
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

  def self.guest
    find_or_create_by!(email: 'guest@music.com') do |user|
      user.password = SecureRandom.urlsafe_base64

      user.password_confirmation = user.password
      user.name = 'ゲスト'
      user.instrument_id = 2
      user.area_id =  1
      user.role =  1
      user.introduction = 'Tuningに来て頂きありがとうございます。'
    end
  end
  def self.orchestra
    find_or_create_by!(email: 'guest.orchestra@music.com') do |user|
      user.password = SecureRandom.urlsafe_base64

      user.password_confirmation = user.password
      user.name = 'ゲストオーケストラ'
      user.instrument_id = 1
      user.area_id =  1
      user.role =  2
      user.introduction = 'Tuningに来て頂きありがとうございます。
      オーケストラステータスがあるアカウントなので、イベントだけでなく募集をかけたりトークルームを作成できるようになります。'
    end
  end

  def self.search_user(search)
    if search =~  /^[0-9]+$/
      User.where(['id LIKE ?', "%#{search}%"])
    elsif search !=~  /^[0-9]+$/
      User.where("name LIKE?","%#{search}%")
    else
      @users = User.none
    end
  end

end
