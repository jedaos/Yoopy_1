class OmniauthCallbacksController < Devise::OmniauthCallbacksController
require 'linkedin'

  def linkedin
    # client = LinkedIn::Client.new(ENV["LINKID"], ENV["LINKSECRET"])
    # token_object = request.env["omniauth.auth"]["extra"]["access_token"]
    # client.authorize_from_access(token_object.token, token_object.secret)
    # li_profile = client.profile
    # session["li_profile"] = li_profile
    # pp session["li_profile"]
    #
    # auth = request.env["omniauth.auth"]

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
