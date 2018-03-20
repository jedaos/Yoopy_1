class AddTimeColumnToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :expiration, :datetime
  end
end
