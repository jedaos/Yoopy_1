class Hospital < ApplicationRecord
  has_many :jobs
  has_many :favorites, as: :favoritable
  validates :email, presence: true
  validates :institution_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable
end
