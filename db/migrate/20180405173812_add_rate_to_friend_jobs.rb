class AddRateToFriendJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_jobs, :rate, :decimal, :precision => 8, :scale => 2
  end
end
