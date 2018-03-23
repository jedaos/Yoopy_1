class BookingsController < ApplicationController
  respond_to :json
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.json { render json: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors }
      end
    end
    # @booking = current_prof.bookings.build
    # @booking.slot_id = params[:slot_id]
    # respond_with @booking
    # if @booking.save!
    #   redirect_to dashboard_index_path, notice: 'You are booked for this job!'
    # end
  end

  private
  def booking_params
    params.require(:booking).permit(:slot_id, :job_id)
  end
end
