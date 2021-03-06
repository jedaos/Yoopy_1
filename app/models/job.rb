class Job < ApplicationRecord
  has_many :slots, as: :reservable, dependent: :destroy
  belongs_to :hospital  
  has_many :profs, through: :slots, dependent: :destroy
  scope :expired, -> { where('created_at < ?', 3.hours.ago) }
  validates :slot_num, presence: true
  validates :rate, presence: true
  validates :name, presence: true
  validates :description, presence: true

  RATES = [100, 200, 300, 400]



  # def amount_with_commision
  #   ((Job.commision(self.rate)).to_i + self.rate.to_i) * 100
  # end
  #
  def self.make_slots(num_slots, slot_params)
    num_slots.to_i.times { Slot.create(num_slot, slot_params) }
  end
  # private

end
