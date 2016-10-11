class RemoveRestaurantidFromOrder < ActiveRecord::Migration
  def change
      remove_column :orders, :restaurant_id
      remove_column :users, :restaurant_id
  end
end
