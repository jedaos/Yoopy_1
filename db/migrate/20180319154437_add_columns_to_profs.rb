class AddColumnsToProfs < ActiveRecord::Migration[5.1]
  def change
    add_column :profs, :name, :string
    add_column :profs, :license_num, :string
    add_column :profs, :job_title, :string
    add_column :profs, :image, :string
    add_column :profs, :bio, :string
  end
end
