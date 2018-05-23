class NotificationsController < ApplicationController
  before_action :authenticate_prof!, only: [:mark_as_read, :index]


  def index
    @notifications = Notification.where(recipient: current_prof).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_prof).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

   def notify_text
    acct_id = ENV["TWILIO_ID"]
    acct_token = ENV["TWILIO_TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new(acct_id, acct_token)

    from = "+19543290694"
    to = "+19545608938"
    message = @client.messages.create(
      from: @twilio_number,
      to: to,
      body: "Yoopy"
    )
  end

  def notify_favorites
    @hospital = Hospital.find(params[:id])
    acct_id = ENV["TWILIO_ID"]
    acct_token = ENV["TWILIO_TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new(acct_id, acct_token)
    favorites = @hospital.favorites.map{|fav| fav.profs_id}
    professionals = favorites.map{|id| Prof.find(id)}
    prof_numbers = professionals.map{|prof| prof.phone}
    prof_numbers.each do |num|
      from = "+19543290694"
      to = "+1#{num}"
      message = @client.messages.create(
        from: @twilio_number,
        to: to,
        body: "Yoopy favorites"
      )
      flash[:success] = "A text alert has been sent to your favorites"
      
    end
  end

end
