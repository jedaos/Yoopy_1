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
    :source => params[:publishable_key],
    :destination => {
      :account => ENV['stripe_connect'],
    }
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
