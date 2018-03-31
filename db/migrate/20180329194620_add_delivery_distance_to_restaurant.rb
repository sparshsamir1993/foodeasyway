class AddDeliveryDistanceToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :deliver_distance, :integer
  end
end
