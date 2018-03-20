class Slot < ApplicationRecord
  belongs_to :job
  has_one :booking
  has_one :prof, :through => :booking 
end
