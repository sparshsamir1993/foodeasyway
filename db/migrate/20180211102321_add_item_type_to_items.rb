class AddItemTypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_type, :integer
  end
end
