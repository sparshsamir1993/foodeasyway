class CreateOrderRestaurants < ActiveRecord::Migration
  def change
    create_table :order_restaurants do |t|
      t.integer :restaurant_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
