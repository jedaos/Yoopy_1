class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true, optional: true
  belongs_to :prof
end
