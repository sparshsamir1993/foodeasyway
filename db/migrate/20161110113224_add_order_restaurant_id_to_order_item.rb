class AddOrderRestaurantIdToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :order_restaurant_id, :integer
  end
end
