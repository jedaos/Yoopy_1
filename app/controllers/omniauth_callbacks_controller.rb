class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # require 'linkedin'

  def stripe_connect
    @user = Prof.connect_to_stripe(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to new_prof_registration_url
    end
  end
  # if @user.uid?
  #   Stripe::Customer.retrieve(@user.uid)
  # if @user.update_attributes({
  #   provider: request.env["omniauth.auth"].provider,
  #   uid: request.env["omniauth.auth"].uid,
  #   access_code: request.env["omniauth.auth"].credentials.token,
  #   publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
  #   })
  # anything else you need to do in response..


  def linkedin
    @user = Prof.connect_to_linkedin(request.env["omniauth.auth"],current_prof)
    if @user.persisted?

      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_prof_registration_url
    end
  end
end
