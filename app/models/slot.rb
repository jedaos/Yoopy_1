class Slot < ApplicationRecord
  belongs_to :job, dependent: :destroy
  has_one :booking
  has_one :prof, :through => :booking
end
