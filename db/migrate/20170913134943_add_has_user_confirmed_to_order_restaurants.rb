class AddHasUserConfirmedToOrderRestaurants < ActiveRecord::Migration
  def change
    add_column :order_restaurants, :hasUserConfirmed, :boolean
  end
end
