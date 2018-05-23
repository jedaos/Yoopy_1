class ChargesController < ApplicationController



  def new

  end

  def create
    Stripe.api_key = ENV["STRIPE_SECRET"]



    @amount = params[:price].to_i * 100
    case_price = params[:price].to_i
      case case_price
      when 50..100
        @commision = (case_price * 0.15).to_i
      when 101..150
        @commision = (case_price * 0.10).to_i
      when 151..175
        @commision = (case_price * 0.05).to_i
      when 176...200
        @commision = (case_price * 0.03).to_i
      else
        @commision = (case_price * 0.01).to_i
      end


      if Prof.find(params[:prof_id]).uid.nil?
        flash[:error] = "This person has not set up their Stripe account to receive payments"
        redirect_to dashboard_index_path
      else

        token = params[:stripeToken]
        charge = Stripe::Charge.create({
          :amount => @amount + @commision,
          :currency => "usd",
          :source => token,
          :application_fee => @commision * 100
        },
        :stripe_account => Prof.find(params[:prof_id]).uid,
      )


        @booking = Booking.find(params[:booking_id]).update(paid: true)
    end
  end



end
