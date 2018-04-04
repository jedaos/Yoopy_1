class HomeController < ApplicationController
  def index

  end

  def logout
    reset_session
    redirect_back(fallback_location: root_path)
  end
end
