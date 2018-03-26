class Job < ApplicationRecord
  has_many :slots, dependent: :delete_all
  belongs_to :hospital
  has_many :profs, through: :slots
  scope :expired, -> { where('created_at >= ?', 2.minutes.ago) }
  # def self.make_slots(num_slots, slot_params)
  #   num_slots.to_i.times { Slot.create(num_slot, slot_params) }
  # end
  private

end
