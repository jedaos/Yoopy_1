class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to dashboard_index_path
    else
      flash[:error] = "Something went wrong!"
    end
  end

  private
  def job_params
    params.require(:job).permit(:name, :description, :rate, :expiration)
  end
end
