class ChenageStatusToInteger < ActiveRecord::Migration
  def change
    remove_column :order_restaurants, :status
    add_column :order_restaurants, :status, :integer
  end
end
