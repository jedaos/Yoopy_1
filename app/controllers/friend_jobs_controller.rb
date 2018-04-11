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
    if @friendJob.save
      respond_to do |format|
        format.json {render json: @friendJob}
        # format.html { render 'dashboard'}
      end
      else
        flash[:error] = "Something went wrong"
        pp @friendJob.errors.full_messages
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
    redirect_to dashboard_index_path
  end

  private

  def friend_job_params
    params.require(:friendJob).permit(:name, :description, :rate, :friend_id)
  end

end
