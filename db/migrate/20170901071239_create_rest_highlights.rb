class CreateRestHighlights < ActiveRecord::Migration
  def change
    create_table :rest_highlights do |t|
      t.integer :restaurant_id
      t.integer :highlight_id

      t.timestamps null: false
    end
  end
end
