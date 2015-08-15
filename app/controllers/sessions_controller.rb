class SessionsController < ApplicationController
  layout 'admin'
  def new
  end

  def create
    member = Member.find_by(username: params[:session][:username].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      redirect_to admin_posts_path
    else
      flash.now[:danger]= '错误的用户名或密码' 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def log_in(member)
    session[:user_id] = member.id
  end
  
  def current_user
    @current_user ||= Member.find_by(id: session[:user_id])
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
