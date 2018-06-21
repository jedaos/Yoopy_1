class Prof < ApplicationRecord
  has_one_attached :avatar
  has_many :bookings
  belongs_to :favoritable, polymorphic: true, optional: true
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, as: :notifiable, foreign_key: :recipient_id
  geocoded_by :address_geocode
  after_validation :geocode
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.connect_to_stripe(access_token, _ = nil)
    data = access_token.info
      user = Prof.where(email: data['email']).first
        user.phone = access_token.extra.extra_info.support_phone
        user.provider = access_token.provider
        user.uid = access_token.uid
        user.access_code = access_token.credentials.token
        user.publishable_key = access_token.info.stripe_publishable_key
        user.save
      return user
    end
    def address_geocode
      return self.address
    end
end
