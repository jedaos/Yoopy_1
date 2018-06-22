class AddActorTypeAndIdToNotif < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :actor_type, :string
  end
end
