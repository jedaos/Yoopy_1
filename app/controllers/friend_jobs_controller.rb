class FriendJobsController < ApplicationController

  respond_to :json


  def index
    @friendJobs = FriendJob.all
  end

  def new
    @friendJob = FriendJob.new
  end

  def create
    @friendJob = FriendJob.new(friend_job_params)
    @friendJob.friend_id = current_friend.id
    @friendJob.save
    @friendJob.slot_num.to_i.times {Slot.create({reservable_type: 'FriendJob' ,reservable_id: @friendJob.id})}
    respond_to do |format|
      format.js { redirect_to dashboard_index_path }
    end
  end

  def edit
    @friendjob = FriendJob.find(params[:id])
  end

  def update
    @friendJob = FriendJob.find(params[:id])
    if @friendJob.update(friend_job_params)
      flash[:success] = "This job has successfully been updated!"
      redirect_to dashboard_index_path
    else
      render "edit"
    end
  end


  def destroy
    @friendJob = FriendJob.find(params[:id])
    @friendJob.destroy
    render json: @friendJob
  end

  private

  def friend_job_params
    params.require(:friend_job).permit(:name, :description, :rate, :friend_id, :slot_num)
  end

end
