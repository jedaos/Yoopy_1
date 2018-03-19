class Booking < ApplicationRecord
  belongs_to :slots
  belongs_to :prof
end
