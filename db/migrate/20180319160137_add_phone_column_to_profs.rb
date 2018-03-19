class AddPhoneColumnToProfs < ActiveRecord::Migration[5.1]
  def change
    add_column :profs, :phone, :string
  end
end
