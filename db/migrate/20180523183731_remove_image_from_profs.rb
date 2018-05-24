class RemoveImageFromProfs < ActiveRecord::Migration[5.2]
  def change
    remove_column :profs, :image
  end
end
