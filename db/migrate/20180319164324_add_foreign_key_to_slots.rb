class AddForeignKeyToSlots < ActiveRecord::Migration[5.2]
  def change
    add_reference :slots, :job, foreign_key: true
  end
end
