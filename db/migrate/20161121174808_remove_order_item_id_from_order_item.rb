class RemoveOrderItemIdFromOrderItem < ActiveRecord::Migration
  def change
      remove_column :order_restaurants, :order_item_id
  end
end
