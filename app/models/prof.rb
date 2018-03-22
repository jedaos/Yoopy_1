class Prof < ApplicationRecord
  has_many :bookings
  has_many :slots, :through => :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      prof.email = auth.info.email
      prof.password = Devise.friendly_token[0,20]
      prof.name = auth.info.prof   # assuming the user model has a name
   end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :omniauthable




end
