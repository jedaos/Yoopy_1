class Prof < ApplicationRecord
  has_many :bookings
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, linkedin_uid: auth.uid).first_or_create do |user|
  #     prof.email = auth.info.email
  #     prof.password = Devise.friendly_token[0,20]
  #     prof.name = auth.info.prof   # assuming the user model has a name
  #  end
  # end
  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = Prof.where(:link_provider => auth.provider, :uid => auth.uid).first
      if user
        return user
      else
        registered_user = Prof.where(:email => auth.info.email).first
        if registered_user
          return registered_user
        else
          user = Prof.create(name:auth.info.first_name, link_provider:auth.provider, linkedin_uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20],
          )

        end
      end
    end








end
