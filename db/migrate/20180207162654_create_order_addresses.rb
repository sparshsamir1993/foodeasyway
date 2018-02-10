class CreateOrderAddresses < ActiveRecord::Migration
  def change
    create_table :order_addresses do |t|
      t.integer :address_id
      t.integer :order_id
      t.timestamps null: false
    end
  end
end
