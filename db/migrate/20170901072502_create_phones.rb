class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :restaurant_id
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
