class Member < ActiveRecord::Base
  USER_STATUS_BANNED = :user_status_banned
  USER_STATUS_REGISTERED = :user_status_registered
  enum status: [
    USER_STATUS_BANNED,
    USER_STATUS_REGISTERED
  ]
  
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true
  validates :type, presence: true
  validates :status, presence: true

  def authenticate(password)
    self.password == password
  end
end
