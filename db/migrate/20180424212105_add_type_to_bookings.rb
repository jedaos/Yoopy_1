class AddTypeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :type, :string
  end
end
