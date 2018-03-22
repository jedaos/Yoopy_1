class AddProviderToProfs < ActiveRecord::Migration[5.1]
  def change
    add_column :profs, :provider, :string
    add_column :profs, :uid, :string
  end
end
