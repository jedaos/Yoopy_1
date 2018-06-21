class Slot < ApplicationRecord
  belongs_to :reservable, polymorphic: true
  has_one :booking, dependent: :destroy
  has_one :prof, :through => :booking, dependent: :destroy

  scope :friend, -> { where(reservable_type: "FriendJob")}
  scope :facility, -> {where(reservable_type: 'Job')}
  scope :open, -> {where(available: true)}
  scope :not_open, -> {where(available: false)}
end
