class AddOrderItemIdToOrderRestaurant < ActiveRecord::Migration
  def change
    add_column :order_restaurants, :order_item_id, :integer
  end
end
