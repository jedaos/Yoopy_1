class RemoveForeignKeyFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :prof_id
  end
end
