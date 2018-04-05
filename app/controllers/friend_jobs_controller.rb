class FriendJobsController < ApplicationController

  def new
    @friend_job = Friend_job.new
  end

  def create
    @friend_job = Friend_job.new(friend_job_params)
    if @friend_job.save
      respond_to do |format|
        format.json{ flash[:success] = "Your job has been created"}
      else
        flash[:error] = "Something went wrong"
        pp @friend_job.errors.full_messages
      end
  end

  private

  def friend_job_params
    params.require(:friend_job).permit(:name, :description, :rate)
  end

end
