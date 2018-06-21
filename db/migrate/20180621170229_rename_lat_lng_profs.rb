class RenameLatLngProfs < ActiveRecord::Migration[5.2]
  def change
    rename_column :profs, :lat, :latitude
    rename_column :profs, :lng, :longitude
  end
end
