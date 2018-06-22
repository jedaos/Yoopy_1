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
    if @friendJob.slot_num.to_i > params[:friend_job][:slot_num].to_i
      new_slots = @friendJob.slot_num.to_i - params[:friend_job][:slot_num].to_i
      new_slots.times do |slot|
        @friendJob.slots.last.destroy
      end
      flash[:success] = "This job was successfully updated and #{new_slots.to_i} slot(s) were deleted."
      @friendJob.update(friend_job_params)
      redirect_to dashboard_index_path
    elsif @friendJob.slot_num.to_i < params[:friend_job][:slot_num].to_i
      new_slots = params[:friend_job][:slot_num].to_i - @friendJob.slot_num.to_i
      new_slots.times do |slot|
        @friendJob.slots.create
      end
      flash[:success] = "This job was successfully updated and #{new_slots.to_i} slot(s) were added."
      @friendJob.update(friend_job_params)
      redirect_to dashboard_index_path
    elsif @friendJob.update(friend_job_params)
      flash[:success] = "This job was successfully updated."
      redirect_to dashboard_index_path
    else
      flash[:error] = "This job was not successfully updated"
      render nothing: true, status: :unprocessable_entity
    end
  end


  def destroy
    @friendJob = FriendJob.find(params[:id])
    @friendJob.destroy
    redirect_to dashboard_index_path
  end

  private

  def friend_job_params
    params.require(:friend_job).permit(:name, :description, :rate, :friend_id, :slot_num)
  end

end
