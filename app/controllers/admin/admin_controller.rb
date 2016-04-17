class Admin::AdminController < ApplicationController
	include SessionsHelper
	load_and_authorize_resource
	layout 'admin'

	def current_ability
	  @current_ability ||= Ability.new(current_admin)
	end
	
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to login_path, :alert => exception.message
	end
end
