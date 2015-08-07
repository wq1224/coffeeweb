class Admin::AdminController < ApplicationController
	include SessionsHelper
	load_and_authorize_resource
	layout 'admin'
	def current_user
	  @current_user ||= Member.find_by(id: session[:user_id])
	end

	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to login_path, :alert => exception.message
	end
end
