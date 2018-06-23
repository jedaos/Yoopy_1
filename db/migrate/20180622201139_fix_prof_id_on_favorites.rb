class FixProfIdOnFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :prof_id, :bigint
    add_reference :favorites, :profs, foreign_key: true, on_delete: :cascade
  end
end
