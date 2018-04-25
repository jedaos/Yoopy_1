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


  def update
    @friendJob = FriendJob.find(params[:id])
    respond_to do |format|
      if @friendJob.update(friend_job_params)
        format.json {render json: @friendJob}
      else
        flash[:error] = "Something went wrong"
        pp @friendJob.errors.full_messages
      end
    end
  end


  def destroy
    @friendJob = FriendJob.find(params[:id])
    @friendJob.destroy
    render json: @friendJob
  end

  private

  def friend_job_params
    params.require(:friendJob).permit(:name, :description, :rate, :friend_id, :slot_num)
  end

end
