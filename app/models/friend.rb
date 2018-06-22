class Friend < ApplicationRecord
  has_many :friendJobs
  has_many :favorites, as: :favoritable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  geocoded_by :address_geocode
  after_validation :geocode
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def address_geocode
          return self.address
        end
end
