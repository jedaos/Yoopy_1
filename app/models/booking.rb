class Booking < ApplicationRecord
  belongs_to :slot, dependent: :destroy
  belongs_to :prof
end
