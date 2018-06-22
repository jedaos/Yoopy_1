class RemoveActorTypeFromNotif < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :actor_type
  end
end
