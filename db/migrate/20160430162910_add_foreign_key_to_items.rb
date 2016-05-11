class AddForeignKeyToItems < ActiveRecord::Migration
  def change
  	remove_column :items, :restaurant_id
  	add_column :items, :restaurant_id, :integer
  	add_foreign_key :items, :restaurants,column: :restaurant_id
  end
end
