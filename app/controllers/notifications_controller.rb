class NotificationsController < ApplicationController
  before_action :authenticate_prof!, only: [:mark_as_read, :index]
  respond_to :js, :json, :html


  def index
    @notifications = Notification.where(recipient: current_prof).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_prof).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

   def notify_text
    friend = Friend.find(params[:id])
    radius = params[:radius]
    nearby_profs = Prof.near([friend.latitude, friend.longitude], radius)
    amount = params[:amount]     
    acct_id = ENV["TWILIO_ID"]
    acct_token = ENV["TWILIO_TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new(acct_id, acct_token) 
    nearby_profs.each do |prof|
      if prof.phone      
    from = "+19543290694"
    to = "#{prof.phone}"
    message = @client.messages.create(
      from: @twilio_number,
      to: to,
      body: "Yoopy has a job available only #{prof.distance.round(2)} miles away! You can get paid $#{amount} today!"
    )
      else 
        flash[:error] = "#{prof.name} did not include a phone number"
      end 
    end
  end

  def notify_favorites
    if current_hospital
      @notifier = Hospital.find(params[:id])
    elsif current_friend
      @notifier = Friend.find(params[:id])
    else 
      return
    end    
    acct_id = ENV["TWILIO_ID"]
    acct_token = ENV["TWILIO_TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new(acct_id, acct_token)
    favorites = @notifier.favorites.map{|fav| fav.prof_id}
    professionals = favorites.map{|id| Prof.find(id)}
    prof_numbers = professionals.map{|prof| prof.phone}
    prof_numbers.each do |num|
      from = "+19543290694"
      to = "#{num}"
      message = @client.messages.create(
        from: @twilio_number,
        to: to,
        body: "Yoopy favorites"
      )
      flash[:success] = "A text alert has been sent to your favorites"

    end
  end


end
