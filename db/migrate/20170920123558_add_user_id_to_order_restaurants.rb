class AddUserIdToOrderRestaurants < ActiveRecord::Migration
  def change
    add_column :order_restaurants, :user_id, :integer
  end
end
