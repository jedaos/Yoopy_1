class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:institution_name, :street,
    :email, :phone, :city, :zip, :license_num, :job_title, :bio, :image, :name ])
    #in keys you list all the input you want to accept.
  end
end
