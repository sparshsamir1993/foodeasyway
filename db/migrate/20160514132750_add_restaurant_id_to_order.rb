class AddRestaurantIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :restaurant_id, :string
  end
end
