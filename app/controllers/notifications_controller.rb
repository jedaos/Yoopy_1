class NotificationsController < ApplicationController
  before_action :authenticate_prof!

  def index
    @notifications = Notification.where(recipient: current_prof).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_prof).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
  
end
