class FriendJobsController < ApplicationController

  def new
    @friendJob = FriendJob.new
  end

  def create
    @friendJob = FriendJob.new(friend_job_params)
    if @friendJob.save
      respond_to do |format|
        format.json { render json: FriendJob.all.order(:name) }
      end
      else
        flash[:error] = "Something went wrong"
        pp @friendJob.errors.full_messages
      end
  end

  private

  def friend_job_params
    params.require(:friendJob).permit(:name, :description, :rate, :friend_id)
  end

end
