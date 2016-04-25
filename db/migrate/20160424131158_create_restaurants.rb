class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string "item"
    	t.integer "price"
    	t.integer "contact"
    	t.integer "quantity"
      	t.timestamps null: false
    end
  end
end
