class AddTypeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :type, :string
  end
end
