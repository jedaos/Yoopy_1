class AddColumnsToSlots < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :slots, :jobs
  end
end
