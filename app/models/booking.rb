class Booking < ApplicationRecord
  belongs_to :slot, dependent: :destroy_all
  belongs_to :prof
end
