class AddStatusToOrderRestaurant < ActiveRecord::Migration
  def change
    add_column :order_restaurants, :status, :string
    remove_column :orders, :status
  end
end
