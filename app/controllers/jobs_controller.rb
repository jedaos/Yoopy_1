class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy]
  respond_to :json

  def index
    @jobs = Job.all
    @slots = Slot.all
    @friendJobs = FriendJob.all
    @hospitals = Hospital.all
    if current_prof
      @user = current_prof
    else
      @user = current_hospital
    end

    end

  def new
    if hospital_signed_in? || friend_signed_in?
      @job = Job.new
    else
      redirect_to dashboard_index_path
    end
    # @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save
    ###CREATE NOTIFICATIONS HERE
        Prof.all.each do |prof|
          Notification.create(recipient: prof, actor: current_hospital, action: "posted", notifiable: @job)
        end
      # Job.make_slots(params[:slot_num], @job.id)
      @job.slot_num.to_i.times {Slot.create({:job_id => @job.id})}
    redirect_to dashboard_index_path

    else
      p @job.errors.full_messages
      flash[:error] = "Something went wrong!"
    end

    # end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    # respond_with Job.destroy(params[:id]
  end


    def update
      if @job.update(job_params)
        # respond_with @job, json: @job
        redirect_to dashboard_index_path
      else
        render nothing: true, status: :unprocessable_entity
      end
    end

    def destroy
      @job.destroy
      redirect_to dashboard_index_path
    end



  private
  def set_job
      @job = Job.find(params[:id])
    end

  def job_params
    params.require(:job).permit(:name, :description, :rate, :hospital_id, :slot_num)
  end
end
