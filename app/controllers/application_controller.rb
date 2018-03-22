class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def prof_signed_in?
    current_prof ? true : false
  end

  def hospital_signed_in?
    current_hospital ? true : false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:institution_name, :street,
    :email, :phone, :city, :zip, :license_num, :job_title, :bio, :image, :name ])
    #in keys you list all the input you want to accept.
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :bio, :job_title, :phone, :image) }
  end
end
