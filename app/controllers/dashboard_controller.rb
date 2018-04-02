class DashboardController < ApplicationController


  def index



    if current_prof

      @li_profile = session['li_profile']
      pp session['li_profile']
      # @li_profile.headline

      render 'dashboard/prof'
    elsif current_hospital
      @jobs = current_hospital.jobs
      render 'dashboard/hospital'
    else
      redirect_to root_path
    end


  end

  def show
    @jobs = Job.all
  end
end
