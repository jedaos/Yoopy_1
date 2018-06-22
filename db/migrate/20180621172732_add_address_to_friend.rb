class AddAddressToFriend < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :latitude, :float
    add_column :friends, :longitude, :float
  end
end
