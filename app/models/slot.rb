class Slot < ApplicationRecord
  belongs_to :reservable, polymorphic: true, dependent: :destroy
  has_one :booking, dependent: :destroy
  has_one :prof, :through => :booking, dependent: :destroy

  scope :friend, -> { where(reservable_type: "FriendJob")}
  scope :facility, -> {where(reservable_type: 'Job')}
end
