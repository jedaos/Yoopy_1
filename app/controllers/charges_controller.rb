class ChargesController < ApplicationController



  def new
  end

  def create


    Stripe.api_key = ENV["STRIPE_SECRET"]


    byebug
    @amount = params[:price].to_i * 100


    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )


    token = params[:stripeToken]
    commision = params[:commision].to_i * 100
    charge = Stripe::Charge.create({
      :amount => @amount,
      :currency => "usd",
      :source => 'tok_visa',#params[:stripeToken],
      :destination => {
        :amount => @amount - commision,
        :account => Prof.find(params[:prof_id]).uid,
      }
    })
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
