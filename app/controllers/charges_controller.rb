class ChargesController < ApplicationController
  def new
  end

  def create
  @amount = 500

  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )

  charge = Stripe::Charge.create({
    :amount => 1000,
    :currency => "usd",
    :source => 'tok_visa', #params[:stripeToken],
    :destination => {
       # :amount => this is where we can take out a fee.
      :account => params[:publishable_key],
    }
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
