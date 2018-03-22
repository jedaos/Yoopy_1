class Prof < ApplicationRecord
  has_many :bookings
  has_many :slots, :through => :bookings
  devise :omniauthable, :omniauth_providers => [:linkedin]
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
         :recoverable, :rememberable, :trackable, :validatable

         def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
         prof = Prof.where(:provider => auth.provider, :uid => auth.uid).first
         if prof
           return prof
         else
           registered_prof = Prof.where(:email => auth.info.email).first
           if registered_prof
             return registered_prof
           else

             prof = Prof.create(name:auth.info.first_name,
                                 provider:auth.provider,
                                 uid:auth.uid,
                                 email:auth.info.email,
                                 password:Devise.friendly_token[0,20],
                               )
           end

         end
       end



end
