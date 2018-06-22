class AddLatLngToProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :lat, :float
    add_column :profs, :lng, :float
  end
end
