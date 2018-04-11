class DashboardController < ApplicationController


  def index



    if current_prof

      @li_profile = LinkedIn::Client.new(ENV["LINKID"], ENV["LINKSECRET"])
      @li_profile.authorize_from_access(current_prof.link_token, current_prof.link_secret)
      @li_profile




      # pp session['li_profile']
      # @li_profile.headline

      render 'dashboard/prof'

    elsif current_hospital

      @jobs = current_hospital.jobs

      render 'dashboard/hospital'

    elsif current_friend
      @friendJobs = current_friend.friendJobs
      render 'dashboard/friend'

    else

      redirect_to root_path

    end


  end

  def prof_show
    @prof = Prof.find(params[:id])
    # @jobs = current_hospital.jobs
    # slots = jobs.each{|job| job.slots}
    # booking = Prof.find(Booking.first.prof_id)
    if @prof.link_provider.nil?

    else
      @li_profile = LinkedIn::Client.new(ENV["LINKID"], ENV["LINKSECRET"])
      @li_profile.authorize_from_access(@prof.link_token, @prof.link_secret)
    end
      respond_to do |format|
        format.js {}
      end
    end

  def show
    @jobs = Job.all
  end
end
