class Job < ApplicationRecord
  has_many :slots, dependent: :destroy
  belongs_to :hospital
  has_many :profs, through: :slots, dependent: :destroy
  scope :expired, -> { where('created_at < ?', 3.hours.ago) }

  RATES = [100, 200, 300, 400]

  
  def self.rate
    @rate = [100, 200, 300]
  end

  # def self.make_slots(num_slots, slot_params)
  #   num_slots.to_i.times { Slot.create(num_slot, slot_params) }
  # end
  private

end
