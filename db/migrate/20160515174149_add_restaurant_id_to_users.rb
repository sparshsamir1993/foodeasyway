class AddRestaurantIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :restaurant_id, :string
  end
end
