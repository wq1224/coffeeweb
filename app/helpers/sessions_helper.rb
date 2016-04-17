module SessionsHelper

  # 返回当前登录的用户（如果有的话）
  def current_admin
    #binding.pry
    @current_admin ||= Member.find_by(id: session[:admin_id])
  end

  # 如果用户已登录，返回 true，否则返回 false
  def logged_in_admin?
    #binding.pry
    !current_admin.nil?
  end

end
