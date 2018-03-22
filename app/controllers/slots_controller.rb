class SlotsController < ApplicationController

  def index
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      redirect_to dashboard_index_path
    else
      flash[:error] = "something went wrong"
  end
  private
  def slot_params
    params.require(:slot).permit(:job_id)
  end
end
