class AddPhoneColumnToProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :profs, :phone, :string
  end
end
