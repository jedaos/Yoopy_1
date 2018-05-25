class AddForeignKeyToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :profs, foreign_key: true
  end
end
