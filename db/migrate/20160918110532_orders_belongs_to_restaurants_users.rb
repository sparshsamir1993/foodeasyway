class OrdersBelongsToRestaurantsUsers < ActiveRecord::Migration
  def change
      add_reference :orders, :user, foreign_key: true
      add_reference :orders, :restaurant, foreign_key: true

  end
end
