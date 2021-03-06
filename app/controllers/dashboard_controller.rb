class DashboardController < ApplicationController


  def index

    if current_prof
      render 'dashboard/prof'
    elsif current_hospital

      @jobs = current_hospital.jobs
      render 'dashboard/hospital'

    elsif current_friend
      @friendJobs = current_friend.friendJobs
      @bookedSlots = current_friend.friendJobs.map{|job| job.slots.where(available: false)}                 
      respond_to do |format|
        format.html{ render 'dashboard/friend' }
        format.js
      end

    else

      redirect_to root_path

    end

  end

  def prof_show
    @prof = Prof.find(params[:id])
    case params[:type]
    when "friend_job"
      @job = FriendJob.find(params[:job])
    when "job"
      @job = Job.find(params[:job])
    end
    @booking_id = params[:booking_id]
  end

  def prof_show_hospital
    @prof = Prof.find(params[:id])
    case params[:type]
    when "friend_job"
      @job = FriendJob.find(params[:job])
    when "job"
      @job = Job.find(params[:job])
    end
    @booking_id = params[:booking_id]
  end

  def hospital_show
    @hospital = Hospital.find(params[:id])
    @job = Job.find(params[:job])
  end


  def show
    @jobs = Job.all
  end
end
