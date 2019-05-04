class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :info

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_to root_url
  end

  def resource_name
   :user
  end

   def resource_class
     User
   end
   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end

   helper_method :resource, :resource_name, :devise_mapping, :resource_class
end
