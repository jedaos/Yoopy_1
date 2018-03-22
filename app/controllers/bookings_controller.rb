class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = current_prof.bookings.build
    @booking.slot_id = params[:slot_id]
    if @booking.save!
      redirect_to dashboard_index_path, notice: 'You are booked for this job!'
    end
  end
end
