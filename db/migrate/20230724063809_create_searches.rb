class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :recipe_name, null: false
      t.string :genre_name, null: false
      t.integer :serving, null: false
      t.integer :price, null: false
      t.integer :cooking_time, null: false
      t.string :ingredient, null: false
      t.string :recipe, null: false
      t.string :point, null: false
      t.timestamps
    end
  end
end
