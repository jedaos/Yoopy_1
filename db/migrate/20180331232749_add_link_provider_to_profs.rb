class AddLinkProviderToProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :link_provider, :string
  end
end
