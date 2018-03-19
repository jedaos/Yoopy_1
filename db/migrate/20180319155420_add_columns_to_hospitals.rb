class AddColumnsToHospitals < ActiveRecord::Migration[5.1]
  def change
    add_column :hospitals, :institution_name, :string
    add_column :hospitals, :street, :string
    add_column :hospitals, :city, :string
    add_column :hospitals, :zip, :string
    add_column :hospitals, :phone, :string
  end
end
