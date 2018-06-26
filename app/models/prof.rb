class Prof < ApplicationRecord
  has_one_attached :avatar
  has_many :bookings
  #has_many :favorites, :as => :favoritable
  #has_many :favorites, as: :favoritable 
  #:favoritable, polymorphic: true, optional: true, dependent: :destroy
  # belongs_to :favorites, as: :favoritable
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, as: :notifiable, foreign_key: :recipient_id
  geocoded_by :address_geocode
  after_validation :geocode
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true   


  def self.connect_to_stripe(access_token, _ = nil)
    data = access_token.info
      user = Prof.where(email: data['email']).first
        phone = access_token.extra.extra_info.support_phone        
        provider = access_token.provider
        uid = access_token.uid
        access_code = access_token.credentials.token
        publishable_key = access_token.info.stripe_publishable_key        
        user.update(phone: phone, provider: provider, uid: uid, access_code: access_code, publishable_key: publishable_key)        
      return user
    end
    def address_geocode
      return self.address
    end
end
