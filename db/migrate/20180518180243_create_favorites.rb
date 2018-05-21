class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :favoritable, :polymorphic => true, index: true      
      t.timestamps
    end
  end
end
