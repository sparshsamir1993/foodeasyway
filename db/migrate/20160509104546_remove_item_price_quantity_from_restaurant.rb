class RemoveItemPriceQuantityFromRestaurant < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :item
  	remove_column :restaurants, :price
  	remove_column :restaurants, :quantity
  end
end
