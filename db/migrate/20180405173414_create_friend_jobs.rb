class CreateFriendJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_jobs do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
