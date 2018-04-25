class RenameTypeToBookingType < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :type, :booking_type
  end
end
