class AddLinkProviderToProfs < ActiveRecord::Migration[5.1]
  def change
    add_column :profs, :link_provider, :string
  end
end
