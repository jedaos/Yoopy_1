class FixProfIdOnFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :prof_id, :bigint    
  end
end
