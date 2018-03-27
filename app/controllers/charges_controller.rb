class ChargesController < ApplicationController
  require "stripe"
  def new
  end

  def create

    @amount = params[:price].to_i * 100


    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    Stripe.api_key = ENV["stripe_secret"]

    token = params[:stripeToken]

    charge = Stripe::Charge.create({
      :amount => @amount,
      :currency => "usd",
      :source => 'tok_visa',#params[:stripeToken],
      :destination => {
        :amount => Job.commision(@amount * 100).to_i,
        :account => Prof.find(params[:prof_id]).uid,
      }
    })

    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to new_charge_path
    # end
  end

end
