class Member < ActiveRecord::Base
  USER_STATUS_BANNED = :user_status_banned
  USER_STATUS_REGISTERED = :user_status_registered
  enum status: [
    USER_STATUS_BANNED,
    USER_STATUS_REGISTERED
  ]
  
  def authenticate(password)
    self.password == password
  end
end
