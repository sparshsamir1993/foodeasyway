class AddLatLngToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :lat, :integer
    add_column :addresses, :lng, :integer
    remove_column :addresses, :map_address
    remove_column :addresses, :house_number
  end
end
