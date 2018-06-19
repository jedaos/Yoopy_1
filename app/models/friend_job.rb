class FriendJob < ApplicationRecord
  belongs_to :friend
  has_many :slots, as: :reservable, dependent: :destroy

  
end
