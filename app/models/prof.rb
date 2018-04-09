class Prof < ApplicationRecord
  has_many :bookings
  has_many :slots, :through => :bookings, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
# signed_in_resource=nil
  def self.connect_to_stripe(auth, current_prof)
      if current_prof
        current_prof.uid = auth.uid
        current_prof.provider = auth.provider
        current_prof.publishable_key = auth.info.publishable_key
        current_prof.save
        return current_prof
      elsif user = Prof.find_by(:provider => auth.provider, :uid => auth.uid)
        return user
      else
        Prof.create(
          name: auth.info.name,
          email: auth.info.email,
          publishable_key: auth.info.stripe_publishable_key,
          uid: auth.uid,
          provider: auth.provider,
          password:Devise.friendly_token[0,20]
      )
    end
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
