class OmniauthCallbacksController < Devise::OmniauthCallbacksController  

  def stripe_connect
    @user = Prof.connect_to_stripe(request.env['omniauth.auth'], current_prof)
     set_notice_and_redirect
  end

  private
  def set_notice_and_redirect
      if @user.persisted?
          flash[:notice] = 'Successfully signed in'
          set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
          sign_in_and_redirect @user, event: :authentication
        else
          session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
          redirect_to home_index_path
      end
    end
end
