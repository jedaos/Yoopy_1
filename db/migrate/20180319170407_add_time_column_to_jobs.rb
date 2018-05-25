class AddTimeColumnToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :expiration, :datetime
  end
end
