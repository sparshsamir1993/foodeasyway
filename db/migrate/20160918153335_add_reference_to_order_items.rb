class AddReferenceToOrderItems < ActiveRecord::Migration
  def change
      add_reference :order_items, :order, foreign_key: true
  end
end
