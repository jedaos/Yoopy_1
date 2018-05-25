class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true

  validates :favoritable_id, uniqueness: { scope: :profs_id}
end
