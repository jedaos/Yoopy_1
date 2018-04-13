class ChargesController < ApplicationController



  def new
  end

  def create


    Stripe.api_key = ENV["STRIPE_SECRET"]



    @amount = params[:price].to_i


    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    if Prof.find(params[:prof_id]).uid.nil?
      redirect_to dashboard_index_path
      @error_message = "This person has not set up their Stripe account to receive payments"
    else

      token = params[:stripeToken]
      commision = params[:commision].to_i
      charge = Stripe::Charge.create({
        :amount => @amount,
        :currency => "usd",
        :source => params[:stripeToken],
        :application_fee => commision
      },
          :stripe_account => Prof.find(params[:prof_id]).uid,

      )
      @booking = Booking.find(params[:booking_id]).update(paid: true)
  end



    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end


end
