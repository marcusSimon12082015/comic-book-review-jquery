class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    comics_path
  end 
end
