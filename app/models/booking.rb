class Booking < ApplicationRecord
  belongs_to :slot
  belongs_to :prof, dependent: :destroy

  scope :resident, -> { where(booking_type: "FriendJob")}
  scope :institute, -> { where(booking_type: "Job")}
end
