class AddReferenceToOrderItemsForItems < ActiveRecord::Migration
  def change
      add_reference :order_items, :item, foreign_key: true
      remove_column :orders, :item_id
  end
end
