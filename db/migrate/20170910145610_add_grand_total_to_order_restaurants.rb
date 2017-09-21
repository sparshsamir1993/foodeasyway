class AddGrandTotalToOrderRestaurants < ActiveRecord::Migration
  def change
    add_column :order_restaurants, :grand_total, :integer
    
  end
end
