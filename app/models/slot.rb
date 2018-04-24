class Slot < ApplicationRecord
  belongs_to :reservable, polymorphic: true, dependent: :destroy
  has_one :booking, dependent: :destroy
  has_one :prof, :through => :booking, dependent: :destroy
end
