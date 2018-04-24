class AddReservableTypeAndIdToSlots < ActiveRecord::Migration[5.1]
  def change
    remove_column :slots, :job_id
    add_reference :slots, :reservable, polymorphic: true, index: true
  end
end
