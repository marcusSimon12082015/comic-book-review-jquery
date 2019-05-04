class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    comics_path
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      response_to_sign_up_failure resource
    end
  end

  def response_to_sign_up_failure(resource)
    if resource.email == "" && resource.password == nil
      flash[:error] = "Please fill in the form"
    elsif User.pluck(:email).include? resource.email
      flash[:error] = "Email already exists"
    end
    if URI(request.referrer).path == root_path
      redirect_to root_path
    else
      flash[:error] = nil
      respond_with resource
    end
  end
end
