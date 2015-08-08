class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(username: params[:session][:username].downcase)
    if member
      log_in member
      redirect_to admin_posts_path
    else
      flash.now[:danger]= 'Invalid email/password combination' 
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
