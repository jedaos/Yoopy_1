# frozen_string_literal: true

class Hospitals::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  # def stripe_connect
  #   @hospital = current_hospital
  #   if @hospital.update_attributes({
  #       provider: request.env["omniauth.auth"].provider,
  #       uid: request.env["omniauth.auth"].uid,
  #       access_code: request.env["omniauth.auth"].credentials.token,
  #       publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
  #     })
  #     # anything else you need to do in response..
  #     sign_in_and_redirect @hospital, :event => :authentication
  #     set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
  #   else
  #     session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
