class AddPaidToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :paid, :boolean
  end
end
