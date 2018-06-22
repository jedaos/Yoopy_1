class FriendJob < ApplicationRecord
  belongs_to :friend
  has_many :slots, as: :reservable, dependent: :destroy
  
  scope :expired, -> { where('created_at < ?', 3.hours.ago) }
  
end
