class SwitchFavoritesBack < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :profs_id, :prof_id
  end
end
