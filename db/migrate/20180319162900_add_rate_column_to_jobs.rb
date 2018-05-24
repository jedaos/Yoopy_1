class AddRateColumnToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :rate, :decimal, :precision => 8, :scale => 2
  end
end
