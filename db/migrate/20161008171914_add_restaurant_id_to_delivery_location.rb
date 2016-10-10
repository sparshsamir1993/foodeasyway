class AddRestaurantIdToDeliveryLocation < ActiveRecord::Migration
  def change
    add_column :delivery_locations, :restaurant_id, :integer
  end
end
