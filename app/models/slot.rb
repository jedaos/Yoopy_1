class Slot < ApplicationRecord
  belongs_to :job, dependent: :destroy
  has_one :booking, dependent: :destroy
  has_one :prof, :through => :booking, dependent: :destroy
end
