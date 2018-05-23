class RemoveImageFromProfs < ActiveRecord::Migration[5.1]
  def change
    remove_column :profs, :image
  end
end
