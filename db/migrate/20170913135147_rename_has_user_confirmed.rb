class RenameHasUserConfirmed < ActiveRecord::Migration
  def change
  	rename_column :order_restaurants, :hasUserConfirmed, :has_user_confirmed
  end
end
