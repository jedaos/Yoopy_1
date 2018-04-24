class AddSlotNumberToFriendJob < ActiveRecord::Migration[5.1]
  def change
    add_column :friend_jobs, :slot_num, :integer
  end
end
