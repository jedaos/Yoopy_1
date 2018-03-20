class Job < ApplicationRecord
  has_many :slots
  belongs_to :hospital
end
