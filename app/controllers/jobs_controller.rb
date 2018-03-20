class JobsController < ApplicationController

  def new
    @job = Job.new
    # @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    # respond_to do |format|
    if @job.save
      # redirect_to dashboard_index_path
      # format.json { render action: 'show', status: :created, location: @job }
      # format.js   { render 'dashboard/hospital', status: :created, location: @job }
    else
      flash[:error] = "Something went wrong!"
    end
    # end
  end
  def show
    @jobs = Job.all
  end

  private
  def job_params
    params.require(:job).permit(:name, :description, :rate, :expiration, :hospital_id)
  end
end
