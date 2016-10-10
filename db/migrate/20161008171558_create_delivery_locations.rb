class CreateDeliveryLocations < ActiveRecord::Migration
  def change
    create_table :delivery_locations do |t|
      t.string :location

      t.timestamps null: false
    end
  end
end
