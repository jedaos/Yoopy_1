class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "Prof"
  belongs_to :actor, class_name: "Hospital"
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{where(read_at: nil)}
end
