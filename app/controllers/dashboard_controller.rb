class DashboardController < ApplicationController
  def index
    if current_prof
      render 'dashboard/prof'
    elsif current_hospital
      render 'dashboard/hospital'
    else
      redirect_to root_path
    end
  end
end
