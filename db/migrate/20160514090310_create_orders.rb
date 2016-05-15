class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :order
      t.timestamps null: false
    end
  end
end
