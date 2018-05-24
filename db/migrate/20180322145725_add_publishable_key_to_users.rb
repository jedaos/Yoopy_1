class AddPublishableKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :publishable_key, :string
    add_column :profs, :provider, :string
    add_column :profs, :uid, :string
    add_column :profs, :access_code, :string

    add_column :hospitals, :publishable_key, :string
    add_column :hospitals, :provider, :string
    add_column :hospitals, :uid, :string
    add_column :hospitals, :access_code, :string
  end
end
