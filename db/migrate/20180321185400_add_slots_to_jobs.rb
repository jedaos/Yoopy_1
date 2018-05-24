class AddSlotsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :slot_num, :string
  end
end
