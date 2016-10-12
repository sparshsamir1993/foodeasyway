class AddReferenceToOrderItemsForItems < ActiveRecord::Migration
  def change
      add_reference :order_items, :item, foreign_key: true
  end
end
