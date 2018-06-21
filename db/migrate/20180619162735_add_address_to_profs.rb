class AddAddressToProfs < ActiveRecord::Migration[5.2]
  def change
    remove_column :profs, :linkedin_uid
    remove_column :profs, :link_provider
    remove_column :profs, :link_token
    remove_column :profs, :link_secret
    add_column :profs, :address, :string
  end
end
