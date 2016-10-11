class AddTotalToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :total, :integer
  end
end
