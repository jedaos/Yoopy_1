class Prof < ApplicationRecord
  has_many :bookings
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
# signed_in_resource=nil
  def self.connect_to_stripe(access_token, _ = nil)
    data = access_token.info
      user = Prof.where(email: data['email']).first_or_create(
        email: data['email'],
        password: Devise.friendly_token[0, 20],
        provider: access_token.provider,
        uid: access_token.uid,
        access_code: access_token.credentials.token,
        publishable_key: access_token.info.stripe_publishable_key
      )
      return user
    end


  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = Prof.find_by(:link_provider => auth.provider, :linkedin_uid => auth.uid)
    if user
      user.link_token = auth["extra"]["access_token"].token
      user.link_secret = auth["extra"]["access_token"].secret
      user.save
      return user

    else
      registered_user = Prof.where(:email => auth.info.email).first
      if registered_user
        registered_user.link_secret = auth["extra"]["access_token"].secret
        registered_user.link_token = auth["extra"]["access_token"].token
        registered_user.save
        return registered_user#.update(link_token:auth["extra"]["access_token"].token, link_secret:auth["extra"]["access_token"].secret)
      else
        user = Prof.create(name:auth.info.first_name, link_provider:auth.provider, linkedin_uid:auth.uid, link_token:auth["extra"]["access_token"].token, link_secret:auth["extra"]["access_token"].secret, email:auth.info.email, password:Devise.friendly_token[0,20],
        )

      end
    end

  end









end
