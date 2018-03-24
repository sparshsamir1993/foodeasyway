class ChangeLatLngToDouble < ActiveRecord::Migration
  def change
    change_column :addresses, :lat, :float
    change_column :addresses, :lng, :float
  end
end
