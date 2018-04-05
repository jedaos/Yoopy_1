class Job < ApplicationRecord
  has_many :slots, dependent: :destroy
  belongs_to :hospital
  # belongs_to :friend
  has_many :profs, through: :slots, dependent: :destroy
  scope :expired, -> { where('created_at < ?', 3.hours.ago) }

  RATES = [100, 200, 300, 400]

  def self.commision(price)
    case price
    when 100..150
      return price * 0.15
    when 150..175
      return price * 0.10
    when 175..200
      return price * 0.05
    when 200...300
      return price * 0.03
    else
      return price * 0.01
    end
  end

  def amount_with_commision
    (Job.commision(self.rate)) + self.rate
  end

  # def self.make_slots(num_slots, slot_params)
  #   num_slots.to_i.times { Slot.create(num_slot, slot_params) }
  # end
  private

end
