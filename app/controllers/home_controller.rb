class HomeController < ApplicationController
  def index

      # @account = Stripe::Account.retrieve(ENV["stripe_client_id"])
      # @account.login_links.create()
      #
  end

  def logout
    reset_session
    redirect_back(fallback_location: root_path)
  end
end
