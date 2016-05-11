class DropTableItemsRestaurants < ActiveRecord::Migration
  def down
  	drop_table :items
  	drop_table :restaurants
  end
end
