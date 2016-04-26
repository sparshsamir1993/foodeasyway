class ChangeIntegerLimitInRestaurant < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :contact, :integer
  	add_column :restaurants, :contact, :numeric
  end
end
