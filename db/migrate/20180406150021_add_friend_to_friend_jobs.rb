class AddFriendToFriendJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :friend_jobs, :friend, index: true
  end
end
