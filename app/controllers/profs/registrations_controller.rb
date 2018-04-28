# frozen_string_literal: true

class Profs::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  include Accessible
  skip_before_action :check_user, only: [:destroy, :update]





  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   #super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end
  #
  # PUT /resource
  def update
    @prof = current_prof

    if @prof.update(prof_params)
      redirect_to dashboard_index_path
    else
      redirect_back(fallback_location: dashboard_index_path, notice: "something went wrong, please try again.")
    end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  private
  def prof_params
    params.require(:prof).permit(:bio, :job_title, :image, :phone, :email)
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :job_title, :image, :phone])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    "https://connect.stripe.com/express/oauth/authorize?redirect_uri=http://localhost:3000/profs/auth/stripe_connect/callback&client_id=#{ENV['STRIPE_CLIENT_ID']}&state=signup"
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
