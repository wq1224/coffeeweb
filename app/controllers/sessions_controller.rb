class SessionsController < ApplicationController
  layout 'admin'
  def new
  end

  def create
    member = Member.find_by(username: params[:session][:username].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in_admin member
      redirect_to admin_posts_path
    else
      flash.now[:danger]= '错误的用户名或密码' 
      render 'new'
    end
  end

  def destroy
    log_out_admin
    redirect_to login_path
  end

  def log_in_admin(member)
    session[:admin_id] = member.id
  end
  
  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

end
