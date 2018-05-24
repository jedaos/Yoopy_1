class AddRateSelectToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :rate_select, :integer
  end
end
