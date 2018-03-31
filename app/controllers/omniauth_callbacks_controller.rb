class OmniauthCallbacksController < Devise::OmniauthCallbacksController

   def linkedin
     auth = request.env["omniauth.auth"]
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
