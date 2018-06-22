class FriendJob < ApplicationRecord
  belongs_to :friend
  has_many :slots, as: :reservable, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :rate, presence: true
  validates :slot_num, presence: true
  scope :expired, -> { where('created_at < ?', 3.hours.ago) }
  
end
