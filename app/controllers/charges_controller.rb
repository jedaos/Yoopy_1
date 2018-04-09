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


    token = params[:stripeToken]
    commision = params[:commision].to_i
    charge = Stripe::Charge.create({
      :amount => @amount,
      :currency => "usd",
      :source => 'tok_visa',#params[:stripeToken],
      :application_fee => commision
    },
        :stripe_account => Prof.find(params[:prof_id]).uid,

    )
    byebug


   # respond_to do |format|
   #   format.json {render :json => charge}
   # end

    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to new_charge_path
    # end
  end

end
