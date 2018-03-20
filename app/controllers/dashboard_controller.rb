class DashboardController < ApplicationController
  def index
    if current_prof
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
