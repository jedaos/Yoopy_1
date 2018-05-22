class DashboardController < ApplicationController


  def index

    if current_prof
      render 'dashboard/prof'
    elsif current_hospital

      @jobs = current_hospital.jobs

      render 'dashboard/hospital'

    elsif current_friend
      @friendJobs = current_friend.friendJobs
      render 'dashboard/friend'

    else

      redirect_to root_path

    end


  end

  def prof_show
    @prof = Prof.find(params[:id])    
  end


  def show
    @jobs = Job.all
  end
end
