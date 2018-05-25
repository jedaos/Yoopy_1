class AddAvailableColumnToSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :available, :boolean, default: true
  end
end
