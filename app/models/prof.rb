class Prof < ApplicationRecord
  has_one_attached :avatar
  has_many :bookings
  belongs_to :favoritable, polymorphic: true, optional: true
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, as: :notifiable, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.connect_to_stripe(access_token, _ = nil)
    data = access_token.info
      user = Prof.where(email: data['email']).first
        # user.email = data['email'],
        # password: Devise.friendly_token[0, 20],
        user.provider = access_token.provider
        user.uid = access_token.uid
        user.access_code = access_token.credentials.token
        user.publishable_key = access_token.info.stripe_publishable_key
        user.save
      return user
    end
end
