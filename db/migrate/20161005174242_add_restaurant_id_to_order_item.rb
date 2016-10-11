class AddRestaurantIdToOrderItem < ActiveRecord::Migration
  def change
      add_column :order_items, :restaurant_id, :integer
  end
end
