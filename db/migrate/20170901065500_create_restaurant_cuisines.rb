class CreateRestaurantCuisines < ActiveRecord::Migration
  def change
    create_table :restaurant_cuisines do |t|
      t.integer :restaurant_id
      t.integer :cuisine_id

      t.timestamps null: false
    end
  end
end
