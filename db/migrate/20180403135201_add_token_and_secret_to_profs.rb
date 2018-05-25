class AddTokenAndSecretToProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :link_token, :string
    add_column :profs, :link_secret, :string
  end
end
