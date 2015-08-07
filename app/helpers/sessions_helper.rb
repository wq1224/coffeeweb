module SessionsHelper
  def log_in(member)
    session[:user_id] = member.id
  end

  # 返回当前登录的用户（如果有的话）
  def current_user
    @current_user ||= Member.find_by(id: session[:user_id])
  end

  # 如果用户已登录，返回 true，否则返回 false
  def logged_in?
    !current_user.nil?
  end

end
