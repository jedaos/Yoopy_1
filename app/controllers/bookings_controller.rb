class BookingsController < ApplicationController
  respond_to :json
  def index
    @bookings = Booking.all
  end

  def create
    @booking = current_prof.bookings.new(booking_params)
    respond_to do |format|
      format.json do
        if @booking.save!
           @booking.slot.available = false
           @booking.slot.save!
           render json: @booking

        else
          render json: { :errors => @booking.errors.messages }, status: 442
        end
      end
    end
  end
  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.slot.available = true
    @booking.slot.save
    @booking.destroy
    redirect_to dashboard_index_path
  end

    # @booking = current_prof.bookings.build
    # @booking.slot_id = params[:slot_id]
    # respond_with @booking
    # if @booking.save!
    #   redirect_to dashboard_index_path, notice: 'You are booked for this job!'
    # end


  private
  def booking_params
    params.require(:booking).permit(:slot_id, :booking_type)
  end
end
