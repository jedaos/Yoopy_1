class Job < ApplicationRecord
  has_many :slots
  belongs_to :hospital
  has_many :profs, through: :slots
  # def self.make_slots(num_slots, slot_params)
  #   num_slots.to_i.times { Slot.create(num_slot, slot_params) }
  # end
  private

end
