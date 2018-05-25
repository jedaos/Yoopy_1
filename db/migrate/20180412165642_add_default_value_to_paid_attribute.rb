class AddDefaultValueToPaidAttribute < ActiveRecord::Migration[5.2]
  def up
    change_column :bookings, :paid, :boolean, default: false
  end

  def down
    change_column :bookings, :paid, :boolean, default: nil
  end
end
