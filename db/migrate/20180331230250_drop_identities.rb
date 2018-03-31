class DropIdentities < ActiveRecord::Migration[5.1]
  def change
    drop_table :identities
  end
end
