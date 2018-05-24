class AddLinkedInUidToProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :linkedin_uid, :string
  end
end
