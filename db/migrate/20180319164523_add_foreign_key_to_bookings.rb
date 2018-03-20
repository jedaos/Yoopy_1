class AddForeignKeyToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :slot, foreign_key: true
    add_reference :bookings, :prof, foreign_key: true
  end
end
