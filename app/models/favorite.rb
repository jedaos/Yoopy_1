class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true, dependent: :destroy

  validates :favoritable_id, uniqueness: { scope: :profs_id}
end
