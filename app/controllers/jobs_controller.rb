class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy, :edit, :show]
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
    if hospital_signed_in?
      @job = Job.new
    else
      redirect_to dashboard_index_path
    end
  end

  def create
    @job = Job.create(job_params)

    if @job.save && @job.errors.empty?
      Prof.all.each do |prof|
        Notification.create(recipient: prof, actor: current_hospital, action: "posted", notifiable: @job)
      end
      @job.slot_num.to_i.times {Slot.create({reservable_type: 'Job' ,reservable_id: @job.id})}
      redirect_to dashboard_index_path
    else
      render action: "new"
    end
  end

  def show

  end

  def edit
    @job.update(job_params)
  end

  def destroy
    @job.destroy
  end
  def edit
  end

    def update
      if @job.slot_num > params[:job][:slot_num]
        new_slots = @job.slot_num.to_i - params[:job][:slot_num].to_i
        new_slots.times do |slot|
          @job.slots.last.destroy
        end
        flash[:success] = "This job was successfully updated and #{new_slots.to_i} slot(s) were deleted."
        @job.update(job_params)
        redirect_to dashboard_index_path
      elsif @job.slot_num < params[:job][:slot_num]
        new_slots = params[:job][:slot_num].to_i - @job.slot_num.to_i
        new_slots.times do |slot|
          @job.slots.create
        end
        flash[:success] = "This job was successfully updated and #{new_slots.to_i} slot(s) were added."
        @job.update(job_params)
        redirect_to dashboard_index_path
      elsif @job.update(job_params)
        flash[:success] = "This job was successfully updated."
        redirect_to dashboard_index_path
      else
        flash[:error] = "This job was not successfully updated"
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
