class DashboardController < ApplicationController


  def index

    if current_prof
      render 'dashboard/prof'
    elsif current_hospital

      @jobs = current_hospital.jobs
      render 'dashboard/hospital'

    elsif current_friend
      @friendJobs = current_friend.friendJobs
        @bookedSlots = current_friend.friendJobs.map{|job| job.slots.where(available: false)}
          gmaps = GoogleMapsService::Client.new
            @prof_address = Prof.all.map{|prf| {latLng: gmaps.geocode(prf.address), phone: prf.phone}}
              gon.profs = @prof_address.flatten.map{|add| {address: add[:latLng][0][:geometry][:location], phone: add[:phone]}}
                @friendBookings = current_friend.friendJobs.map{|job| job.slots.where(available: false).map{|slot| slot.booking.prof.address}}
                  @res = @friendBookings.select{|book| book.count > 0}.map{|book| gmaps.geocode(book)}
                    @res.flatten
                      gon.friendBook = @res.flatten.map{|re| re[:geometry][:location]}
      respond_to do |format|
        format.html{ render 'dashboard/friend' }
        format.js
      end

    else

      redirect_to root_path

    end

  end

  def prof_show
    @prof = Prof.find(params[:id])
    case params[:type]
    when "friend_job"
      @job = FriendJob.find(params[:job])
    when "job"
      @job = Job.find(params[:job])
    end
    @booking_id = params[:booking_id]
  end

  def prof_show_hospital
    @prof = Prof.find(params[:id])
    case params[:type]
    when "friend_job"
      @job = FriendJob.find(params[:job])
    when "job"
      @job = Job.find(params[:job])
    end
    @booking_id = params[:booking_id]
  end

  def hospital_show
    @hospital = Hospital.find(params[:id])
    @job = Job.find(params[:job])
  end


  def show
    @jobs = Job.all
  end
end
